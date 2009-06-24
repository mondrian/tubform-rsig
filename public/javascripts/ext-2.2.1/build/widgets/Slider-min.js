Ext.Slider=Ext.extend(Ext.BoxComponent,{vertical:false,minValue:0,maxValue:100,keyIncrement:1,increment:0,clickRange:[5,15],clickToChange:true,animate:true,dragging:false,initComponent:function(){if(this.value===undefined){this.value=this.minValue}Ext.Slider.superclass.initComponent.call(this);this.keyIncrement=Math.max(this.increment,this.keyIncrement);this.addEvents("beforechange","change","changecomplete","dragstart","drag","dragend");if(this.vertical){Ext.apply(this,Ext.Slider.Vertical)}},onRender:function(){this.autoEl={cls:"x-slider "+(this.vertical?"x-slider-vert":"x-slider-horz"),cn:{cls:"x-slider-end",cn:{cls:"x-slider-inner",cn:[{cls:"x-slider-thumb"},{tag:"a",cls:"x-slider-focus",href:"#",tabIndex:"-1",hidefocus:"on"}]}}};Ext.Slider.superclass.onRender.apply(this,arguments);this.endEl=this.el.first();this.innerEl=this.endEl.first();this.thumb=this.innerEl.first();this.halfThumb=(this.vertical?this.thumb.getHeight():this.thumb.getWidth())/2;this.focusEl=this.thumb.next();this.initEvents()},initEvents:function(){this.thumb.addClassOnOver("x-slider-thumb-over");this.mon(this.el,"mousedown",this.onMouseDown,this);this.mon(this.el,"keydown",this.onKeyDown,this);this.focusEl.swallowEvent("click",true);this.tracker=new Ext.dd.DragTracker({onBeforeStart:this.onBeforeDragStart.createDelegate(this),onStart:this.onDragStart.createDelegate(this),onDrag:this.onDrag.createDelegate(this),onEnd:this.onDragEnd.createDelegate(this),tolerance:3,autoStart:300});this.tracker.initEl(this.thumb);this.on("beforedestroy",this.tracker.destroy,this.tracker)},onMouseDown:function(b){if(this.disabled){return}if(this.clickToChange&&b.target!=this.thumb.dom){var a=this.innerEl.translatePoints(b.getXY());this.onClickChange(a)}this.focus()},onClickChange:function(a){if(a.top>this.clickRange[0]&&a.top<this.clickRange[1]){this.setValue(Math.round(this.reverseValue(a.left)),undefined,true)}},onKeyDown:function(b){if(this.disabled){b.preventDefault();return}var a=b.getKey();switch(a){case b.UP:case b.RIGHT:b.stopEvent();if(b.ctrlKey){this.setValue(this.maxValue,undefined,true)}else{this.setValue(this.value+this.keyIncrement,undefined,true)}break;case b.DOWN:case b.LEFT:b.stopEvent();if(b.ctrlKey){this.setValue(this.minValue,undefined,true)}else{this.setValue(this.value-this.keyIncrement,undefined,true)}break;default:b.preventDefault()}},doSnap:function(b){if(!this.increment||this.increment==1||!b){return b}var d=b,c=this.increment;var a=b%c;if(a>0){if(a>(c/2)){d=b+(c-a)}else{d=b-a}}return d.constrain(this.minValue,this.maxValue)},afterRender:function(){Ext.Slider.superclass.afterRender.apply(this,arguments);if(this.value!==undefined){var a=this.normalizeValue(this.value);if(a!==this.value){delete this.value;this.setValue(a,false)}else{this.moveThumb(this.translateValue(a),false)}}},getRatio:function(){var a=this.innerEl.getWidth();var b=this.maxValue-this.minValue;return b==0?a:(a/b)},normalizeValue:function(a){if(typeof a!="number"){a=parseInt(a)}a=Math.round(a);a=this.doSnap(a);a=a.constrain(this.minValue,this.maxValue);return a},setValue:function(b,a,c){b=this.normalizeValue(b);if(b!==this.value&&this.fireEvent("beforechange",this,b,this.value)!==false){this.value=b;this.moveThumb(this.translateValue(b),a!==false);this.fireEvent("change",this,b);if(c){this.fireEvent("changecomplete",this,b)}}},translateValue:function(a){var b=this.getRatio();return(a*b)-(this.minValue*b)-this.halfThumb},reverseValue:function(b){var a=this.getRatio();return(b+this.halfThumb+(this.minValue*a))/a},moveThumb:function(b,a){if(!a||this.animate===false){this.thumb.setLeft(b)}else{this.thumb.shift({left:b,stopFx:true,duration:0.35})}},focus:function(){this.focusEl.focus(10)},onBeforeDragStart:function(a){return !this.disabled},onDragStart:function(a){this.thumb.addClass("x-slider-thumb-drag");this.dragging=true;this.dragStartValue=this.value;this.fireEvent("dragstart",this,a)},onDrag:function(a){var b=this.innerEl.translatePoints(this.tracker.getXY());this.setValue(Math.round(this.reverseValue(b.left)),false);this.fireEvent("drag",this,a)},onDragEnd:function(a){this.thumb.removeClass("x-slider-thumb-drag");this.dragging=false;this.fireEvent("dragend",this,a);if(this.dragStartValue!=this.value){this.fireEvent("changecomplete",this,this.value)}},onDisable:function(){Ext.Slider.superclass.onDisable.call(this);this.thumb.addClass(this.disabledClass);if(Ext.isIE){var a=this.thumb.getXY();this.thumb.hide();this.innerEl.addClass(this.disabledClass).dom.disabled=true;if(!this.thumbHolder){this.thumbHolder=this.endEl.createChild({cls:"x-slider-thumb "+this.disabledClass})}this.thumbHolder.show().setXY(a)}},onEnable:function(){Ext.Slider.superclass.onEnable.call(this);this.thumb.removeClass(this.disabledClass);if(Ext.isIE){this.innerEl.removeClass(this.disabledClass).dom.disabled=false;if(this.thumbHolder){this.thumbHolder.hide()}this.thumb.show();this.syncThumb()}},onResize:function(a,b){this.innerEl.setWidth(a-(this.el.getPadding("l")+this.endEl.getPadding("r")));this.syncThumb()},syncThumb:function(){if(this.rendered){this.moveThumb(this.translateValue(this.value))}},getValue:function(){return this.value}});Ext.reg("slider",Ext.Slider);Ext.Slider.Vertical={onResize:function(a,b){this.innerEl.setHeight(b-(this.el.getPadding("t")+this.endEl.getPadding("b")));this.syncThumb()},getRatio:function(){var b=this.innerEl.getHeight();var a=this.maxValue-this.minValue;return b/a},moveThumb:function(b,a){if(!a||this.animate===false){this.thumb.setBottom(b)}else{this.thumb.shift({bottom:b,stopFx:true,duration:0.35})}},onDrag:function(b){var c=this.innerEl.translatePoints(this.tracker.getXY());var a=this.innerEl.getHeight()-c.top;this.setValue(this.minValue+Math.round(a/this.getRatio()),false);this.fireEvent("drag",this,b)},onClickChange:function(b){if(b.left>this.clickRange[0]&&b.left<this.clickRange[1]){var a=this.innerEl.getHeight()-b.top;this.setValue(this.minValue+Math.round(a/this.getRatio()),undefined,true)}}};