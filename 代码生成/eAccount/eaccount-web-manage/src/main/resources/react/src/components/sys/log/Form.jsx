const { connect } = dva;
const { Form, Form: { Item }, Input, Button } = antd;
const { CrudForm } = require('../../Widgets.jsx');
const Constants = require("../../Constants.jsx");
import { namespace } from '../../../models/sys/Log.jsx'

class sysLogForm extends CrudForm {
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
                    <Item {...layout} label='ip地址' hasFeedback>
                        {getFieldDecorator('ipAddress', {
                            rules: [
                                { required: true, message: '请输入ip地址!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='操作员id' hasFeedback>
                        {getFieldDecorator('userId', {
                            rules: [
                                { required: true, message: '请输入操作员id!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='日志信息' hasFeedback>
                        {getFieldDecorator('message', {
                            rules: [
                                { required: true, message: '请输入日志信息!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='创建时间' hasFeedback>
                        {getFieldDecorator('createTime', {
                            rules: [
                                { required: true, message: '请输入创建时间!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='操作员名称' hasFeedback>
                        {getFieldDecorator('userName', {
                            rules: [
                                { required: true, message: '请输入操作员名称!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='日志级别' hasFeedback>
                        {getFieldDecorator('logLevel', {
                            rules: [
                                { required: true, message: '请输入日志级别!' }
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
})(Form.create()(sysLogForm));