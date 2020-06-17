import ModelUtils from '../../utils/ModelUtils.jsx'

export const namespace =  'caseInfo';
export const baseUrl =  'case/info';

const model = ModelUtils(baseUrl, namespace);

export default {
    ...model
};