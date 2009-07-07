module ExtCrud
  module ClassMethods
    def controller_crud_methods_for( *args )
      options = args.extract_options!.symbolize_keys
      klass = args.first
      name = klass.name
      plural = klass.name.pluralize.underscore
      singular = klass.name.underscore
      metadata_total = 'total'
      metadata_root  = 'results'
      metadata_id    = 'id'
      columns = ''
      options[:metadata_for].each do |column|
        columns << "{:name => \'#{column}\'},"
      end

      methods = %Q!

  before_filter :load_page, :only => :index
  before_filter :load_#{singular}, :only => [ :edit, :new, :create, :update, :destroy ]

  def index
    @#{plural} = #{name}.find(:all, :conditions => @conditions).paginate( :page => @page,
                                                                     :per_page => @per_page )

    respond_to do |format|
      format.html #index.html.erb
      format.json { render :json => { :metaData => { :totalProperty => 'total',
                                                     :root => 'results',
                                                     :id => 'id',
                                                     :fields => [
                                                     #{columns}
                                                     {:name => 'id'}]
                                                   },
                                      :results => @#{plural},
                                      :total => @#{plural}.total_entries } }
    end
  end

  def new; end
  def edit; end

  def create
    create_or_update
  end

  def update
    create_or_update
  end

  def destroy
    @#{singular}.destroy

    respond_to do |format|
      format.json  { head :ok }
    end
  end

  protected

  def load_#{singular}
    @#{singular} = params[:id].blank? ? #{name}.new : #{name}.find(params[:id])
  end

  def create_or_update
    if @#{singular}.update_attributes(params[:#{singular}])
      respond_to do |format|
        format.json  { render :json => @#{singular},
                              :status => :created,
                              :location => @#{singular} }
      end
    else
      respond_to do |format|
        format.json  { render :text => @#{singular}.errors.full_messages,
                              :location => @#{singular},
                              :status => :unprocessable_entity }
      end
    end
  end
!
      class_eval methods
    end
  end

  module JavascriptBuilder
    def ext_grid_for( *args )
      options = args.extract_options!.symbolize_keys
      entity = options[:entity];
      entities = entity.pluralize;
      columns = []
      options[:columns].each do |key, value|
        columns << "{header: \'#{key}\', width:120, sortable:true, dataIndex: \'#{value}\'}"
      end
      columns = columns.join(',')

      js = %Q!
<script type="text/javascript">
var grid;
var create  = JJWorks.JActionCreate('#{entity}', '#{entities}');
var edit    = JJWorks.JActionEdit('#{entity}', '#{entities}');
var save    = JJWorks.JActionSave('#{entity}', '#{entities}');
var update  = JJWorks.JActionUpdate('#{entity}', '#{entities}');
var destroy = JJWorks.JActionDestroy('#{entities}');

Ext.onReady(function(e){

  grid = new JJWorks.JGrid({
    columns: [
      {id:'id', header:'Id', width:10, sortable:true, dataIndex:'id'},
      #{columns}
    ],
    title:'Listagem de #{entities.capitalize}',
    renderTo: 'grid-#{entities}',
    entities: '#{entities}',
    plugins: [new Ext.ux.grid.Search({
      iconCls:'icon-zoom',
      readonlyIndexes:['note'],
      disableIndexes:['pctChange'],
      minChars:3,
      autoFocus:true
    })]
  });

});
</script>
<div id="grid-#{entities}">
</div>
!
      js
    end
  end
end

