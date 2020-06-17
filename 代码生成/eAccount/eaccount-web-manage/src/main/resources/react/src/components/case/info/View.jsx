const { connect } = dva;
const { Input, Table } = antd;
const { BaseSearchForm, Plink } = require('../../Widgets.jsx');
const { ToolbarGroup } = Plink;
const Constants = require('../../Constants.jsx');
import { namespace } from '../../../models/case/Info.jsx'

const formType = `${namespace}/openFormPage`;

function caseInfo (props) {
    const { searchData, dataSource, pagination, loading, dispatch } = props;
    return (
        <div style={{ padding: 20 }}>
            <div className='search-result-list'>
                <ToolbarGroup>
                    <Plink type='primary' //sn='sn_save'
                        onClick={ () => dispatch({ type: formType }) }>新增</Plink>
                </ToolbarGroup>
                <Table
                    className="ant-table-wrapper-tag"
                    dataSource={dataSource}
                    pagination={pagination}
                    loading={loading}
                    onChange={( pagination ) => { dispatch({ type: `${namespace}/paginationLoad`, payload: { pagination }}) }}
                    bordered
                    columns={ [
                        {
                            title: '问题来源',
                            dataIndex: 'questionSource'
                        },
                        {
                            title: '所属区域',
                            dataIndex: 'areaCode'
                        },
                        {
                            title: '案卷编号',
                            dataIndex: 'caseNo'
                        },
                        {
                            title: '案件状态：0-待派发 1-待处理',
                            dataIndex: 'status'
                        },
                        {
                            title: '案件坐标：当前巡查员所在位置',
                            dataIndex: 'positionCode'
                        },
                        {
                            title: '巡查员：当前登陆用户',
                            dataIndex: 'Inspector'
                        },
                        {
                            title: '受理时间',
                            dataIndex: 'acceptTime'
                        },
                        {
                            title: '案件类别：0-市容环境',
                            dataIndex: 'type'
                        },
                        {
                            title: '问题描述',
                            dataIndex: 'questionDesc'
                        },
                        {
                            title: '',
                            dataIndex: 'updateTime'
                        },
                        {
                            title: '',
                            dataIndex: 'createTime'
                        },
                        {
                            title: '备注',
                            dataIndex: 'remark'
                        },
                        {
                            title: '案件位置',
                            dataIndex: 'position'
                        },
                        {
                            title: '删除：0-未删除 1-删除',
                            dataIndex: 'deleted'
                        },
                        {
                            title: '案件等级',
                            dataIndex: 'level'
                        },
                        Plink.getTableColumnAction( [ {
                            label: '编辑',
                            //sn: 'sn_update',
                            onClick: (text, record) => dispatch({ type: formType, payload: { record }})
                        }, {
                            label: '删除',
                            //sn: 'sn_delete',
                            confirmText: Constants.DELETE_TEXT,
                            onConfirm: (text, record) => dispatch({ type: `${namespace}/del`, payload: { record }})
                        } ])
                    ] }
                    />
            </div>
        </div>
    );
}

module.exports = connect(state => {
    const effects = state.loading.effects;
    return {
        ...state[namespace],
        loading: effects[`${namespace}/fetch`] || effects[`${namespace}/del`]
    }
})(caseInfo);