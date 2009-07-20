/*
 * Generated by JasperReports - 15/07/09 15:56
 */
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.fill.*;

import java.util.*;
import java.math.*;
import java.text.*;
import java.io.*;
import java.net.*;

import net.sf.jasperreports.engine.*;
import java.util.*;
import net.sf.jasperreports.engine.data.*;


/**
 *
 */
public class nota_fiscal_1247684164310_742908 extends JREvaluator
{


    /**
     *
     */
    private JRFillParameter parameter_REPORT_LOCALE = null;
    private JRFillParameter parameter_REPORT_TIME_ZONE = null;
    private JRFillParameter parameter_REPORT_VIRTUALIZER = null;
    private JRFillParameter parameter_XML_USERNAME = null;
    private JRFillParameter parameter_REPORT_FILE_RESOLVER = null;
    private JRFillParameter parameter_REPORT_SCRIPTLET = null;
    private JRFillParameter parameter_REPORT_PARAMETERS_MAP = null;
    private JRFillParameter parameter_REPORT_CONNECTION = null;
    private JRFillParameter parameter_REPORT_CLASS_LOADER = null;
    private JRFillParameter parameter_REPORT_DATA_SOURCE = null;
    private JRFillParameter parameter_REPORT_URL_HANDLER_FACTORY = null;
    private JRFillParameter parameter_IS_IGNORE_PAGINATION = null;
    private JRFillParameter parameter_XML_PASSWORD = null;
    private JRFillParameter parameter_XML_DATE_PATTERN = null;
    private JRFillParameter parameter_XML_DATA_DOCUMENT = null;
    private JRFillParameter parameter_REPORT_FORMAT_FACTORY = null;
    private JRFillParameter parameter_REPORT_MAX_COUNT = null;
    private JRFillParameter parameter_XML_LOCALE = null;
    private JRFillParameter parameter_REPORT_TEMPLATES = null;
    private JRFillParameter parameter_XML_NUMBER_PATTERN = null;
    private JRFillParameter parameter_XML_URL = null;
    private JRFillParameter parameter_REPORT_RESOURCE_BUNDLE = null;
    private JRFillParameter parameter_XML_TIME_ZONE = null;
    private JRFillField field_item_valor_total = null;
    private JRFillField field_nf_base_de_calculo_icms_subs_trib = null;
    private JRFillField field_nf_valor_total_desconto = null;
    private JRFillField field_trans_razao_social = null;
    private JRFillField field_cliente_fone_fax = null;
    private JRFillField field_cliente_razao_social = null;
    private JRFillField field_item_valor_unitario = null;
    private JRFillField field_nf_data_de_emissao = null;
    private JRFillField field_nf_percentual_desconto = null;
    private JRFillField field_cliente_bairro = null;
    private JRFillField field_item_valor_do_ipi = null;
    private JRFillField field_nf_valor_total_dos_produtos = null;
    private JRFillField field_nf_serie = null;
    private JRFillField field_cliente_endereco = null;
    private JRFillField field_nf_data_entrada = null;
    private JRFillField field_cliente_inscricao_estadual = null;
    private JRFillField field_nf_base_de_calculo_do_icms = null;
    private JRFillField field_nf_valor_icms_subs_trib = null;
    private JRFillField field_trans_uf = null;
    private JRFillField field_nf_quantidade_volumes = null;
    private JRFillField field_nf_data_saida = null;
    private JRFillField field_trans_cnpj = null;
    private JRFillField field_nf_valor_total_do_ipi = null;
    private JRFillField field_item_icms = null;
    private JRFillField field_nf_percentual_icms = null;
    private JRFillField field_item_quantidade = null;
    private JRFillField field_nf_numero_nota = null;
    private JRFillField field_cliente_cep = null;
    private JRFillField field_cliente_cidade = null;
    private JRFillField field_trans_cidade = null;
    private JRFillField field_nf_valor_do_frete = null;
    private JRFillField field_item_unidade = null;
    private JRFillField field_nf_valor_por_extenso = null;
    private JRFillField field_nf_valor_do_icms = null;
    private JRFillField field_nf_numero_do_pedido = null;
    private JRFillField field_item_ipi = null;
    private JRFillField field_item_descricao_produto = null;
    private JRFillField field_item_codigo_produto = null;
    private JRFillField field_cliente_uf = null;
    private JRFillField field_trans_inscricao_estadual = null;
    private JRFillField field_item_sit_trib = null;
    private JRFillField field_nf_numero_do_selo = null;
    private JRFillField field_cliente_cnpj_cpf = null;
    private JRFillField field_nf_cfop = null;
    private JRFillField field_nf_natureza_da_operacao = null;
    private JRFillVariable variable_PAGE_NUMBER = null;
    private JRFillVariable variable_COLUMN_NUMBER = null;
    private JRFillVariable variable_REPORT_COUNT = null;
    private JRFillVariable variable_PAGE_COUNT = null;
    private JRFillVariable variable_COLUMN_COUNT = null;


    /**
     *
     */
    public void customizedInit(
        Map pm,
        Map fm,
        Map vm
        )
    {
        initParams(pm);
        initFields(fm);
        initVars(vm);
    }


    /**
     *
     */
    private void initParams(Map pm)
    {
        parameter_REPORT_LOCALE = (JRFillParameter)pm.get("REPORT_LOCALE");
        parameter_REPORT_TIME_ZONE = (JRFillParameter)pm.get("REPORT_TIME_ZONE");
        parameter_REPORT_VIRTUALIZER = (JRFillParameter)pm.get("REPORT_VIRTUALIZER");
        parameter_XML_USERNAME = (JRFillParameter)pm.get("XML_USERNAME");
        parameter_REPORT_FILE_RESOLVER = (JRFillParameter)pm.get("REPORT_FILE_RESOLVER");
        parameter_REPORT_SCRIPTLET = (JRFillParameter)pm.get("REPORT_SCRIPTLET");
        parameter_REPORT_PARAMETERS_MAP = (JRFillParameter)pm.get("REPORT_PARAMETERS_MAP");
        parameter_REPORT_CONNECTION = (JRFillParameter)pm.get("REPORT_CONNECTION");
        parameter_REPORT_CLASS_LOADER = (JRFillParameter)pm.get("REPORT_CLASS_LOADER");
        parameter_REPORT_DATA_SOURCE = (JRFillParameter)pm.get("REPORT_DATA_SOURCE");
        parameter_REPORT_URL_HANDLER_FACTORY = (JRFillParameter)pm.get("REPORT_URL_HANDLER_FACTORY");
        parameter_IS_IGNORE_PAGINATION = (JRFillParameter)pm.get("IS_IGNORE_PAGINATION");
        parameter_XML_PASSWORD = (JRFillParameter)pm.get("XML_PASSWORD");
        parameter_XML_DATE_PATTERN = (JRFillParameter)pm.get("XML_DATE_PATTERN");
        parameter_XML_DATA_DOCUMENT = (JRFillParameter)pm.get("XML_DATA_DOCUMENT");
        parameter_REPORT_FORMAT_FACTORY = (JRFillParameter)pm.get("REPORT_FORMAT_FACTORY");
        parameter_REPORT_MAX_COUNT = (JRFillParameter)pm.get("REPORT_MAX_COUNT");
        parameter_XML_LOCALE = (JRFillParameter)pm.get("XML_LOCALE");
        parameter_REPORT_TEMPLATES = (JRFillParameter)pm.get("REPORT_TEMPLATES");
        parameter_XML_NUMBER_PATTERN = (JRFillParameter)pm.get("XML_NUMBER_PATTERN");
        parameter_XML_URL = (JRFillParameter)pm.get("XML_URL");
        parameter_REPORT_RESOURCE_BUNDLE = (JRFillParameter)pm.get("REPORT_RESOURCE_BUNDLE");
        parameter_XML_TIME_ZONE = (JRFillParameter)pm.get("XML_TIME_ZONE");
    }


    /**
     *
     */
    private void initFields(Map fm)
    {
        field_item_valor_total = (JRFillField)fm.get("item_valor_total");
        field_nf_base_de_calculo_icms_subs_trib = (JRFillField)fm.get("nf_base_de_calculo_icms_subs_trib");
        field_nf_valor_total_desconto = (JRFillField)fm.get("nf_valor_total_desconto");
        field_trans_razao_social = (JRFillField)fm.get("trans_razao_social");
        field_cliente_fone_fax = (JRFillField)fm.get("cliente_fone_fax");
        field_cliente_razao_social = (JRFillField)fm.get("cliente_razao_social");
        field_item_valor_unitario = (JRFillField)fm.get("item_valor_unitario");
        field_nf_data_de_emissao = (JRFillField)fm.get("nf_data_de_emissao");
        field_nf_percentual_desconto = (JRFillField)fm.get("nf_percentual_desconto");
        field_cliente_bairro = (JRFillField)fm.get("cliente_bairro");
        field_item_valor_do_ipi = (JRFillField)fm.get("item_valor_do_ipi");
        field_nf_valor_total_dos_produtos = (JRFillField)fm.get("nf_valor_total_dos_produtos");
        field_nf_serie = (JRFillField)fm.get("nf_serie");
        field_cliente_endereco = (JRFillField)fm.get("cliente_endereco");
        field_nf_data_entrada = (JRFillField)fm.get("nf_data_entrada");
        field_cliente_inscricao_estadual = (JRFillField)fm.get("cliente_inscricao_estadual");
        field_nf_base_de_calculo_do_icms = (JRFillField)fm.get("nf_base_de_calculo_do_icms");
        field_nf_valor_icms_subs_trib = (JRFillField)fm.get("nf_valor_icms_subs_trib");
        field_trans_uf = (JRFillField)fm.get("trans_uf");
        field_nf_quantidade_volumes = (JRFillField)fm.get("nf_quantidade_volumes");
        field_nf_data_saida = (JRFillField)fm.get("nf_data_saida");
        field_trans_cnpj = (JRFillField)fm.get("trans_cnpj");
        field_nf_valor_total_do_ipi = (JRFillField)fm.get("nf_valor_total_do_ipi");
        field_item_icms = (JRFillField)fm.get("item_icms");
        field_nf_percentual_icms = (JRFillField)fm.get("nf_percentual_icms");
        field_item_quantidade = (JRFillField)fm.get("item_quantidade");
        field_nf_numero_nota = (JRFillField)fm.get("nf_numero_nota");
        field_cliente_cep = (JRFillField)fm.get("cliente_cep");
        field_cliente_cidade = (JRFillField)fm.get("cliente_cidade");
        field_trans_cidade = (JRFillField)fm.get("trans_cidade");
        field_nf_valor_do_frete = (JRFillField)fm.get("nf_valor_do_frete");
        field_item_unidade = (JRFillField)fm.get("item_unidade");
        field_nf_valor_por_extenso = (JRFillField)fm.get("nf_valor_por_extenso");
        field_nf_valor_do_icms = (JRFillField)fm.get("nf_valor_do_icms");
        field_nf_numero_do_pedido = (JRFillField)fm.get("nf_numero_do_pedido");
        field_item_ipi = (JRFillField)fm.get("item_ipi");
        field_item_descricao_produto = (JRFillField)fm.get("item_descricao_produto");
        field_item_codigo_produto = (JRFillField)fm.get("item_codigo_produto");
        field_cliente_uf = (JRFillField)fm.get("cliente_uf");
        field_trans_inscricao_estadual = (JRFillField)fm.get("trans_inscricao_estadual");
        field_item_sit_trib = (JRFillField)fm.get("item_sit_trib");
        field_nf_numero_do_selo = (JRFillField)fm.get("nf_numero_do_selo");
        field_cliente_cnpj_cpf = (JRFillField)fm.get("cliente_cnpj_cpf");
        field_nf_cfop = (JRFillField)fm.get("nf_cfop");
        field_nf_natureza_da_operacao = (JRFillField)fm.get("nf_natureza_da_operacao");
    }


    /**
     *
     */
    private void initVars(Map vm)
    {
        variable_PAGE_NUMBER = (JRFillVariable)vm.get("PAGE_NUMBER");
        variable_COLUMN_NUMBER = (JRFillVariable)vm.get("COLUMN_NUMBER");
        variable_REPORT_COUNT = (JRFillVariable)vm.get("REPORT_COUNT");
        variable_PAGE_COUNT = (JRFillVariable)vm.get("PAGE_COUNT");
        variable_COLUMN_COUNT = (JRFillVariable)vm.get("COLUMN_COUNT");
    }


    /**
     *
     */
    public Object evaluate(int id) throws Throwable
    {
        Object value = null;

        switch (id)
        {
            case 0 : 
            {
                value = (java.lang.Integer)(new Integer(1));//$JR_EXPR_ID=0$
                break;
            }
            case 1 : 
            {
                value = (java.lang.Integer)(new Integer(1));//$JR_EXPR_ID=1$
                break;
            }
            case 2 : 
            {
                value = (java.lang.Integer)(new Integer(1));//$JR_EXPR_ID=2$
                break;
            }
            case 3 : 
            {
                value = (java.lang.Integer)(new Integer(0));//$JR_EXPR_ID=3$
                break;
            }
            case 4 : 
            {
                value = (java.lang.Integer)(new Integer(1));//$JR_EXPR_ID=4$
                break;
            }
            case 5 : 
            {
                value = (java.lang.Integer)(new Integer(0));//$JR_EXPR_ID=5$
                break;
            }
            case 6 : 
            {
                value = (java.lang.Integer)(new Integer(1));//$JR_EXPR_ID=6$
                break;
            }
            case 7 : 
            {
                value = (java.lang.Integer)(new Integer(0));//$JR_EXPR_ID=7$
                break;
            }
            case 8 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_numero_nota.getValue()));//$JR_EXPR_ID=8$
                break;
            }
            case 9 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_natureza_da_operacao.getValue()));//$JR_EXPR_ID=9$
                break;
            }
            case 10 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_cfop.getValue()));//$JR_EXPR_ID=10$
                break;
            }
            case 11 : 
            {
                value = (java.lang.String)(((java.lang.String)field_cliente_razao_social.getValue()));//$JR_EXPR_ID=11$
                break;
            }
            case 12 : 
            {
                value = (java.lang.String)(((java.lang.String)field_cliente_cnpj_cpf.getValue()));//$JR_EXPR_ID=12$
                break;
            }
            case 13 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_data_de_emissao.getValue()));//$JR_EXPR_ID=13$
                break;
            }
            case 14 : 
            {
                value = (java.lang.String)(((java.lang.String)field_cliente_endereco.getValue()));//$JR_EXPR_ID=14$
                break;
            }
            case 15 : 
            {
                value = (java.lang.String)(((java.lang.String)field_cliente_bairro.getValue()));//$JR_EXPR_ID=15$
                break;
            }
            case 16 : 
            {
                value = (java.lang.String)(((java.lang.String)field_cliente_cep.getValue()));//$JR_EXPR_ID=16$
                break;
            }
            case 17 : 
            {
                value = (java.lang.String)(((java.lang.String)field_cliente_cidade.getValue()));//$JR_EXPR_ID=17$
                break;
            }
            case 18 : 
            {
                value = (java.lang.String)(((java.lang.String)field_cliente_fone_fax.getValue()));//$JR_EXPR_ID=18$
                break;
            }
            case 19 : 
            {
                value = (java.lang.String)(((java.lang.String)field_cliente_uf.getValue()));//$JR_EXPR_ID=19$
                break;
            }
            case 20 : 
            {
                value = (java.lang.String)(((java.lang.String)field_cliente_inscricao_estadual.getValue()));//$JR_EXPR_ID=20$
                break;
            }
            case 21 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_data_saida.getValue()));//$JR_EXPR_ID=21$
                break;
            }
            case 22 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_valor_por_extenso.getValue()));//$JR_EXPR_ID=22$
                break;
            }
            case 23 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_codigo_produto.getValue()));//$JR_EXPR_ID=23$
                break;
            }
            case 24 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_descricao_produto.getValue()));//$JR_EXPR_ID=24$
                break;
            }
            case 25 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_sit_trib.getValue()));//$JR_EXPR_ID=25$
                break;
            }
            case 26 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_unidade.getValue()));//$JR_EXPR_ID=26$
                break;
            }
            case 27 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_quantidade.getValue()));//$JR_EXPR_ID=27$
                break;
            }
            case 28 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_valor_unitario.getValue()));//$JR_EXPR_ID=28$
                break;
            }
            case 29 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_valor_total.getValue()));//$JR_EXPR_ID=29$
                break;
            }
            case 30 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_ipi.getValue()));//$JR_EXPR_ID=30$
                break;
            }
            case 31 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_icms.getValue()));//$JR_EXPR_ID=31$
                break;
            }
            case 32 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_valor_do_ipi.getValue()));//$JR_EXPR_ID=32$
                break;
            }
            case 33 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_base_de_calculo_icms_subs_trib.getValue()));//$JR_EXPR_ID=33$
                break;
            }
            case 34 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_valor_do_frete.getValue()));//$JR_EXPR_ID=34$
                break;
            }
            case 35 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_valor_do_icms.getValue()));//$JR_EXPR_ID=35$
                break;
            }
            case 36 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_base_de_calculo_icms_subs_trib.getValue()));//$JR_EXPR_ID=36$
                break;
            }
            case 37 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_valor_total_do_ipi.getValue()));//$JR_EXPR_ID=37$
                break;
            }
            case 38 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_valor_total_dos_produtos.getValue()));//$JR_EXPR_ID=38$
                break;
            }
            case 39 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_valor_icms_subs_trib.getValue()));//$JR_EXPR_ID=39$
                break;
            }
            case 40 : 
            {
                value = (java.lang.String)(((java.lang.String)field_trans_razao_social.getValue()));//$JR_EXPR_ID=40$
                break;
            }
            case 41 : 
            {
                value = (java.lang.String)(((java.lang.String)field_trans_cnpj.getValue()));//$JR_EXPR_ID=41$
                break;
            }
            case 42 : 
            {
                value = (java.lang.String)(((java.lang.String)field_trans_inscricao_estadual.getValue()));//$JR_EXPR_ID=42$
                break;
            }
            case 43 : 
            {
                value = (java.lang.String)(((java.lang.String)field_trans_uf.getValue()));//$JR_EXPR_ID=43$
                break;
            }
            case 44 : 
            {
                value = (java.lang.String)(((java.lang.String)field_trans_uf.getValue()));//$JR_EXPR_ID=44$
                break;
            }
            case 45 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_quantidade_volumes.getValue()));//$JR_EXPR_ID=45$
                break;
            }
            case 46 : 
            {
                value = (java.lang.String)(((java.lang.String)field_trans_cidade.getValue()));//$JR_EXPR_ID=46$
                break;
            }
            case 47 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_numero_nota.getValue()));//$JR_EXPR_ID=47$
                break;
            }
           default :
           {
           }
        }
        
        return value;
    }


    /**
     *
     */
    public Object evaluateOld(int id) throws Throwable
    {
        Object value = null;

        switch (id)
        {
            case 0 : 
            {
                value = (java.lang.Integer)(new Integer(1));//$JR_EXPR_ID=0$
                break;
            }
            case 1 : 
            {
                value = (java.lang.Integer)(new Integer(1));//$JR_EXPR_ID=1$
                break;
            }
            case 2 : 
            {
                value = (java.lang.Integer)(new Integer(1));//$JR_EXPR_ID=2$
                break;
            }
            case 3 : 
            {
                value = (java.lang.Integer)(new Integer(0));//$JR_EXPR_ID=3$
                break;
            }
            case 4 : 
            {
                value = (java.lang.Integer)(new Integer(1));//$JR_EXPR_ID=4$
                break;
            }
            case 5 : 
            {
                value = (java.lang.Integer)(new Integer(0));//$JR_EXPR_ID=5$
                break;
            }
            case 6 : 
            {
                value = (java.lang.Integer)(new Integer(1));//$JR_EXPR_ID=6$
                break;
            }
            case 7 : 
            {
                value = (java.lang.Integer)(new Integer(0));//$JR_EXPR_ID=7$
                break;
            }
            case 8 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_numero_nota.getOldValue()));//$JR_EXPR_ID=8$
                break;
            }
            case 9 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_natureza_da_operacao.getOldValue()));//$JR_EXPR_ID=9$
                break;
            }
            case 10 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_cfop.getOldValue()));//$JR_EXPR_ID=10$
                break;
            }
            case 11 : 
            {
                value = (java.lang.String)(((java.lang.String)field_cliente_razao_social.getOldValue()));//$JR_EXPR_ID=11$
                break;
            }
            case 12 : 
            {
                value = (java.lang.String)(((java.lang.String)field_cliente_cnpj_cpf.getOldValue()));//$JR_EXPR_ID=12$
                break;
            }
            case 13 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_data_de_emissao.getOldValue()));//$JR_EXPR_ID=13$
                break;
            }
            case 14 : 
            {
                value = (java.lang.String)(((java.lang.String)field_cliente_endereco.getOldValue()));//$JR_EXPR_ID=14$
                break;
            }
            case 15 : 
            {
                value = (java.lang.String)(((java.lang.String)field_cliente_bairro.getOldValue()));//$JR_EXPR_ID=15$
                break;
            }
            case 16 : 
            {
                value = (java.lang.String)(((java.lang.String)field_cliente_cep.getOldValue()));//$JR_EXPR_ID=16$
                break;
            }
            case 17 : 
            {
                value = (java.lang.String)(((java.lang.String)field_cliente_cidade.getOldValue()));//$JR_EXPR_ID=17$
                break;
            }
            case 18 : 
            {
                value = (java.lang.String)(((java.lang.String)field_cliente_fone_fax.getOldValue()));//$JR_EXPR_ID=18$
                break;
            }
            case 19 : 
            {
                value = (java.lang.String)(((java.lang.String)field_cliente_uf.getOldValue()));//$JR_EXPR_ID=19$
                break;
            }
            case 20 : 
            {
                value = (java.lang.String)(((java.lang.String)field_cliente_inscricao_estadual.getOldValue()));//$JR_EXPR_ID=20$
                break;
            }
            case 21 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_data_saida.getOldValue()));//$JR_EXPR_ID=21$
                break;
            }
            case 22 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_valor_por_extenso.getOldValue()));//$JR_EXPR_ID=22$
                break;
            }
            case 23 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_codigo_produto.getOldValue()));//$JR_EXPR_ID=23$
                break;
            }
            case 24 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_descricao_produto.getOldValue()));//$JR_EXPR_ID=24$
                break;
            }
            case 25 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_sit_trib.getOldValue()));//$JR_EXPR_ID=25$
                break;
            }
            case 26 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_unidade.getOldValue()));//$JR_EXPR_ID=26$
                break;
            }
            case 27 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_quantidade.getOldValue()));//$JR_EXPR_ID=27$
                break;
            }
            case 28 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_valor_unitario.getOldValue()));//$JR_EXPR_ID=28$
                break;
            }
            case 29 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_valor_total.getOldValue()));//$JR_EXPR_ID=29$
                break;
            }
            case 30 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_ipi.getOldValue()));//$JR_EXPR_ID=30$
                break;
            }
            case 31 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_icms.getOldValue()));//$JR_EXPR_ID=31$
                break;
            }
            case 32 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_valor_do_ipi.getOldValue()));//$JR_EXPR_ID=32$
                break;
            }
            case 33 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_base_de_calculo_icms_subs_trib.getOldValue()));//$JR_EXPR_ID=33$
                break;
            }
            case 34 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_valor_do_frete.getOldValue()));//$JR_EXPR_ID=34$
                break;
            }
            case 35 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_valor_do_icms.getOldValue()));//$JR_EXPR_ID=35$
                break;
            }
            case 36 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_base_de_calculo_icms_subs_trib.getOldValue()));//$JR_EXPR_ID=36$
                break;
            }
            case 37 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_valor_total_do_ipi.getOldValue()));//$JR_EXPR_ID=37$
                break;
            }
            case 38 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_valor_total_dos_produtos.getOldValue()));//$JR_EXPR_ID=38$
                break;
            }
            case 39 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_valor_icms_subs_trib.getOldValue()));//$JR_EXPR_ID=39$
                break;
            }
            case 40 : 
            {
                value = (java.lang.String)(((java.lang.String)field_trans_razao_social.getOldValue()));//$JR_EXPR_ID=40$
                break;
            }
            case 41 : 
            {
                value = (java.lang.String)(((java.lang.String)field_trans_cnpj.getOldValue()));//$JR_EXPR_ID=41$
                break;
            }
            case 42 : 
            {
                value = (java.lang.String)(((java.lang.String)field_trans_inscricao_estadual.getOldValue()));//$JR_EXPR_ID=42$
                break;
            }
            case 43 : 
            {
                value = (java.lang.String)(((java.lang.String)field_trans_uf.getOldValue()));//$JR_EXPR_ID=43$
                break;
            }
            case 44 : 
            {
                value = (java.lang.String)(((java.lang.String)field_trans_uf.getOldValue()));//$JR_EXPR_ID=44$
                break;
            }
            case 45 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_quantidade_volumes.getOldValue()));//$JR_EXPR_ID=45$
                break;
            }
            case 46 : 
            {
                value = (java.lang.String)(((java.lang.String)field_trans_cidade.getOldValue()));//$JR_EXPR_ID=46$
                break;
            }
            case 47 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_numero_nota.getOldValue()));//$JR_EXPR_ID=47$
                break;
            }
           default :
           {
           }
        }
        
        return value;
    }


    /**
     *
     */
    public Object evaluateEstimated(int id) throws Throwable
    {
        Object value = null;

        switch (id)
        {
            case 0 : 
            {
                value = (java.lang.Integer)(new Integer(1));//$JR_EXPR_ID=0$
                break;
            }
            case 1 : 
            {
                value = (java.lang.Integer)(new Integer(1));//$JR_EXPR_ID=1$
                break;
            }
            case 2 : 
            {
                value = (java.lang.Integer)(new Integer(1));//$JR_EXPR_ID=2$
                break;
            }
            case 3 : 
            {
                value = (java.lang.Integer)(new Integer(0));//$JR_EXPR_ID=3$
                break;
            }
            case 4 : 
            {
                value = (java.lang.Integer)(new Integer(1));//$JR_EXPR_ID=4$
                break;
            }
            case 5 : 
            {
                value = (java.lang.Integer)(new Integer(0));//$JR_EXPR_ID=5$
                break;
            }
            case 6 : 
            {
                value = (java.lang.Integer)(new Integer(1));//$JR_EXPR_ID=6$
                break;
            }
            case 7 : 
            {
                value = (java.lang.Integer)(new Integer(0));//$JR_EXPR_ID=7$
                break;
            }
            case 8 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_numero_nota.getValue()));//$JR_EXPR_ID=8$
                break;
            }
            case 9 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_natureza_da_operacao.getValue()));//$JR_EXPR_ID=9$
                break;
            }
            case 10 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_cfop.getValue()));//$JR_EXPR_ID=10$
                break;
            }
            case 11 : 
            {
                value = (java.lang.String)(((java.lang.String)field_cliente_razao_social.getValue()));//$JR_EXPR_ID=11$
                break;
            }
            case 12 : 
            {
                value = (java.lang.String)(((java.lang.String)field_cliente_cnpj_cpf.getValue()));//$JR_EXPR_ID=12$
                break;
            }
            case 13 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_data_de_emissao.getValue()));//$JR_EXPR_ID=13$
                break;
            }
            case 14 : 
            {
                value = (java.lang.String)(((java.lang.String)field_cliente_endereco.getValue()));//$JR_EXPR_ID=14$
                break;
            }
            case 15 : 
            {
                value = (java.lang.String)(((java.lang.String)field_cliente_bairro.getValue()));//$JR_EXPR_ID=15$
                break;
            }
            case 16 : 
            {
                value = (java.lang.String)(((java.lang.String)field_cliente_cep.getValue()));//$JR_EXPR_ID=16$
                break;
            }
            case 17 : 
            {
                value = (java.lang.String)(((java.lang.String)field_cliente_cidade.getValue()));//$JR_EXPR_ID=17$
                break;
            }
            case 18 : 
            {
                value = (java.lang.String)(((java.lang.String)field_cliente_fone_fax.getValue()));//$JR_EXPR_ID=18$
                break;
            }
            case 19 : 
            {
                value = (java.lang.String)(((java.lang.String)field_cliente_uf.getValue()));//$JR_EXPR_ID=19$
                break;
            }
            case 20 : 
            {
                value = (java.lang.String)(((java.lang.String)field_cliente_inscricao_estadual.getValue()));//$JR_EXPR_ID=20$
                break;
            }
            case 21 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_data_saida.getValue()));//$JR_EXPR_ID=21$
                break;
            }
            case 22 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_valor_por_extenso.getValue()));//$JR_EXPR_ID=22$
                break;
            }
            case 23 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_codigo_produto.getValue()));//$JR_EXPR_ID=23$
                break;
            }
            case 24 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_descricao_produto.getValue()));//$JR_EXPR_ID=24$
                break;
            }
            case 25 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_sit_trib.getValue()));//$JR_EXPR_ID=25$
                break;
            }
            case 26 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_unidade.getValue()));//$JR_EXPR_ID=26$
                break;
            }
            case 27 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_quantidade.getValue()));//$JR_EXPR_ID=27$
                break;
            }
            case 28 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_valor_unitario.getValue()));//$JR_EXPR_ID=28$
                break;
            }
            case 29 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_valor_total.getValue()));//$JR_EXPR_ID=29$
                break;
            }
            case 30 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_ipi.getValue()));//$JR_EXPR_ID=30$
                break;
            }
            case 31 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_icms.getValue()));//$JR_EXPR_ID=31$
                break;
            }
            case 32 : 
            {
                value = (java.lang.String)(((java.lang.String)field_item_valor_do_ipi.getValue()));//$JR_EXPR_ID=32$
                break;
            }
            case 33 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_base_de_calculo_icms_subs_trib.getValue()));//$JR_EXPR_ID=33$
                break;
            }
            case 34 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_valor_do_frete.getValue()));//$JR_EXPR_ID=34$
                break;
            }
            case 35 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_valor_do_icms.getValue()));//$JR_EXPR_ID=35$
                break;
            }
            case 36 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_base_de_calculo_icms_subs_trib.getValue()));//$JR_EXPR_ID=36$
                break;
            }
            case 37 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_valor_total_do_ipi.getValue()));//$JR_EXPR_ID=37$
                break;
            }
            case 38 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_valor_total_dos_produtos.getValue()));//$JR_EXPR_ID=38$
                break;
            }
            case 39 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_valor_icms_subs_trib.getValue()));//$JR_EXPR_ID=39$
                break;
            }
            case 40 : 
            {
                value = (java.lang.String)(((java.lang.String)field_trans_razao_social.getValue()));//$JR_EXPR_ID=40$
                break;
            }
            case 41 : 
            {
                value = (java.lang.String)(((java.lang.String)field_trans_cnpj.getValue()));//$JR_EXPR_ID=41$
                break;
            }
            case 42 : 
            {
                value = (java.lang.String)(((java.lang.String)field_trans_inscricao_estadual.getValue()));//$JR_EXPR_ID=42$
                break;
            }
            case 43 : 
            {
                value = (java.lang.String)(((java.lang.String)field_trans_uf.getValue()));//$JR_EXPR_ID=43$
                break;
            }
            case 44 : 
            {
                value = (java.lang.String)(((java.lang.String)field_trans_uf.getValue()));//$JR_EXPR_ID=44$
                break;
            }
            case 45 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_quantidade_volumes.getValue()));//$JR_EXPR_ID=45$
                break;
            }
            case 46 : 
            {
                value = (java.lang.String)(((java.lang.String)field_trans_cidade.getValue()));//$JR_EXPR_ID=46$
                break;
            }
            case 47 : 
            {
                value = (java.lang.String)(((java.lang.String)field_nf_numero_nota.getValue()));//$JR_EXPR_ID=47$
                break;
            }
           default :
           {
           }
        }
        
        return value;
    }


}
