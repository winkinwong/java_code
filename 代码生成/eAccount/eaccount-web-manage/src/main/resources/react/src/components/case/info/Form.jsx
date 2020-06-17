const { connect } = dva;
const { Form, Form: { Item }, Input, Button } = antd;
const { CrudForm } = require('../../Widgets.jsx');
const Constants = require("../../Constants.jsx");
import { namespace } from '../../../models/case/Info.jsx'

class caseInfoForm extends CrudForm {
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
                    <Item {...layout} label='问题来源' hasFeedback>
                        {getFieldDecorator('questionSource', {
                            rules: [
                                { required: true, message: '请输入问题来源!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='所属区域' hasFeedback>
                        {getFieldDecorator('areaCode', {
                            rules: [
                                { required: true, message: '请输入所属区域!' }
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
                    <Item {...layout} label='案件状态：0-待派发 1-待处理' hasFeedback>
                        {getFieldDecorator('status', {
                            rules: [
                                { required: true, message: '请输入案件状态：0-待派发 1-待处理!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='案件坐标：当前巡查员所在位置' hasFeedback>
                        {getFieldDecorator('positionCode', {
                            rules: [
                                { required: true, message: '请输入案件坐标：当前巡查员所在位置!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='巡查员：当前登陆用户' hasFeedback>
                        {getFieldDecorator('Inspector', {
                            rules: [
                                { required: true, message: '请输入巡查员：当前登陆用户!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='受理时间' hasFeedback>
                        {getFieldDecorator('acceptTime', {
                            rules: [
                                { required: true, message: '请输入受理时间!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='案件类别：0-市容环境' hasFeedback>
                        {getFieldDecorator('type', {
                            rules: [
                                { required: true, message: '请输入案件类别：0-市容环境!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='问题描述' hasFeedback>
                        {getFieldDecorator('questionDesc', {
                            rules: [
                                { required: true, message: '请输入问题描述!' }
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
                    <Item {...layout} label='' hasFeedback>
                        {getFieldDecorator('createTime', {
                            rules: [
                                { required: true, message: '请输入!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='备注' hasFeedback>
                        {getFieldDecorator('remark', {
                            rules: [
                                { required: true, message: '请输入备注!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='案件位置' hasFeedback>
                        {getFieldDecorator('position', {
                            rules: [
                                { required: true, message: '请输入案件位置!' }
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
                    <Item {...layout} label='案件等级' hasFeedback>
                        {getFieldDecorator('level', {
                            rules: [
                                { required: true, message: '请输入案件等级!' }
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
})(Form.create()(caseInfoForm));