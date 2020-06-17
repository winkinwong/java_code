const { connect } = dva;
const { Input, Table } = antd;
const { BaseSearchForm, Plink } = require('../../Widgets.jsx');
const { ToolbarGroup } = Plink;
const Constants = require('../../Constants.jsx');
import { namespace } from '../../../models/case/File.jsx'

const formType = `${namespace}/openFormPage`;

function caseFile (props) {
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
                            title: '后缀名',
                            dataIndex: 'fileSuffix'
                        },
                        {
                            title: '案卷编号',
                            dataIndex: 'caseNo'
                        },
                        {
                            title: '删除：0-未删除 1-删除',
                            dataIndex: 'deleted'
                        },
                        {
                            title: '文件名',
                            dataIndex: 'fileName'
                        },
                        {
                            title: '附件地址',
                            dataIndex: 'fileUrl'
                        },
                        {
                            title: '',
                            dataIndex: 'createTime'
                        },
                        {
                            title: '',
                            dataIndex: 'updateTime'
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
})(caseFile);