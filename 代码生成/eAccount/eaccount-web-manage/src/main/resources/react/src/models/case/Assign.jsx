import ModelUtils from '../../utils/ModelUtils.jsx'

export const namespace =  'caseAssign';
export const baseUrl =  'case/assign';

const model = ModelUtils(baseUrl, namespace);

export default {
    ...model
};