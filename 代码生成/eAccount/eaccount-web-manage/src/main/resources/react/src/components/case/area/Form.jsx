const { connect } = dva;
const { Form, Form: { Item }, Input, Button } = antd;
const { CrudForm } = require('../../Widgets.jsx');
const Constants = require("../../Constants.jsx");
import { namespace } from '../../../models/case/Area.jsx'

class caseAreaForm extends CrudForm {
    static defaultProps = {
        namespace
    };
    render() {
        const { form: { getFieldDecorator }, edit: { record }, loading, dispatch } = this.props, { item: { layout, tailLayout }} = Constants.FORM;
        return (
            <div style={{padding: '40px 20px'}}>
                <Form onSubmit={this.handleSubmit.bind(this)}>
                    <Item {...layout} colon={false}
                        label={<span className="form-title">数据{record ? '修改' : '录入'}</span>} />
                    <Item {...layout} label='' hasFeedback>
                        {getFieldDecorator('updateTime', {
                            rules: [
                                { required: true, message: '请输入!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='' hasFeedback>
                        {getFieldDecorator('parentAreaId', {
                            rules: [
                                { required: true, message: '请输入!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='' hasFeedback>
                        {getFieldDecorator('createTime', {
                            rules: [
                                { required: true, message: '请输入!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='案卷编号' hasFeedback>
                        {getFieldDecorator('caseNo', {
                            rules: [
                                { required: true, message: '请输入案卷编号!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='区域编码' hasFeedback>
                        {getFieldDecorator('code', {
                            rules: [
                                { required: true, message: '请输入区域编码!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='区域名称' hasFeedback>
                        {getFieldDecorator('name', {
                            rules: [
                                { required: true, message: '请输入区域名称!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='删除：0-未删除 1-删除' hasFeedback>
                        {getFieldDecorator('deleted', {
                            rules: [
                                { required: true, message: '请输入删除：0-未删除 1-删除!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...tailLayout}>
                        <Button type="primary" htmlType="submit" disabled={loading} size="large">提交</Button>
                        <Button size="large" style={{ marginLeft: 8 }} onClick={ () => dispatch({ type: `${namespace}/closeFormPage`})}>返回</Button>
                    </Item>
                </Form>
            </div>
        );
    }
}

module.exports = connect(state => {
return { ...state[namespace], loading: state.loading.effects[`${namespace}/save`] }
})(Form.create()(caseAreaForm));