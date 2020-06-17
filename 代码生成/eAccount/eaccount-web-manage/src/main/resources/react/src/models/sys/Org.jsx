import ModelUtils from '../../utils/ModelUtils.jsx'

export const namespace =  'sysOrg';
export const baseUrl =  'sys/org';

const model = ModelUtils(baseUrl, namespace);

export default {
    ...model
};