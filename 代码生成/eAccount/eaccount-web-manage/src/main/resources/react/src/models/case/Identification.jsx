import ModelUtils from '../../utils/ModelUtils.jsx'

export const namespace =  'caseIdentification';
export const baseUrl =  'case/identification';

const model = ModelUtils(baseUrl, namespace);

export default {
    ...model
};