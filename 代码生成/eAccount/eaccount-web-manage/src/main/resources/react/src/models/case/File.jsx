import ModelUtils from '../../utils/ModelUtils.jsx'

export const namespace =  'caseFile';
export const baseUrl =  'case/file';

const model = ModelUtils(baseUrl, namespace);

export default {
    ...model
};