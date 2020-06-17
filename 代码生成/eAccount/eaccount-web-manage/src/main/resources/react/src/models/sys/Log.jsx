import ModelUtils from '../../utils/ModelUtils.jsx'

export const namespace =  'sysLog';
export const baseUrl =  'sys/log';

const model = ModelUtils(baseUrl, namespace);

export default {
    ...model
};