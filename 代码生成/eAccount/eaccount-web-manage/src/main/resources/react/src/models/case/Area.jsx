import ModelUtils from '../../utils/ModelUtils.jsx'

export const namespace =  'caseArea';
export const baseUrl =  'case/area';

const model = ModelUtils(baseUrl, namespace);

export default {
    ...model
};