const { connect } = dva;
const { Form, Form: { Item }, Input, Button } = antd;
const { CrudForm } = require('../../Widgets.jsx');
const Constants = require("../../Constants.jsx");
import { namespace } from '../../../models/case/File.jsx'

class caseFileForm extends CrudForm {
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
                    <Item {...layout} label='后缀名' hasFeedback>
                        {getFieldDecorator('fileSuffix', {
                            rules: [
                                { required: true, message: '请输入后缀名!' }
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
                    <Item {...layout} label='删除：0-未删除 1-删除' hasFeedback>
                        {getFieldDecorator('deleted', {
                            rules: [
                                { required: true, message: '请输入删除：0-未删除 1-删除!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='文件名' hasFeedback>
                        {getFieldDecorator('fileName', {
                            rules: [
                                { required: true, message: '请输入文件名!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='附件地址' hasFeedback>
                        {getFieldDecorator('fileUrl', {
                            rules: [
                                { required: true, message: '请输入附件地址!' }
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
                    <Item {...layout} label='' hasFeedback>
                        {getFieldDecorator('updateTime', {
                            rules: [
                                { required: true, message: '请输入!' }
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
})(Form.create()(caseFileForm));