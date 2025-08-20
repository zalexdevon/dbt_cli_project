{% macro gen_yaml_for_staging() %}
    {% set models_to_generate = codegen.get_models(directory="models/staging") %}
    {{ return(codegen.generate_model_yaml(model_names=models_to_generate)) }}
{% endmacro %}
