const { connect } = dva;
const { Form, Form: { Item }, Input, Button } = antd;
const { CrudForm } = require('../../Widgets.jsx');
const Constants = require("../../Constants.jsx");
import { namespace } from '../../../models/sys/Org.jsx'

class sysOrgForm extends CrudForm {
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
                    <Item {...layout} label='名称' hasFeedback>
                        {getFieldDecorator('name', {
                            rules: [
                                { required: true, message: '请输入名称!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='描述' hasFeedback>
                        {getFieldDecorator('description', {
                            rules: [
                                { required: true, message: '请输入描述!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='优先级' hasFeedback>
                        {getFieldDecorator('weight', {
                            rules: [
                                { required: true, message: '请输入优先级!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='父机构id' hasFeedback>
                        {getFieldDecorator('pid', {
                            rules: [
                                { required: true, message: '请输入父机构id!' }
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
})(Form.create()(sysOrgForm));