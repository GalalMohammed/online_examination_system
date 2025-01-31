window.repositoryObject = {"columns_custom_fields":[],"relations_custom_fields":[],"unique_keys_custom_fields":[],"triggers_custom_fields":[],"columns":[{"id":"column-75","object_id":"column-75","name":"Id","name_without_path":"Id","description":null,"is_pk":true,"is_identity":true,"data_type":"int","data_length":null,"is_nullable":false,"computed_formula":null,"default_value":null,"path":null,"level":1,"item_type":"COLUMN","is_user_defined":false,"custom_fields":{},"linked_terms":[],"references":[],"linked_lookup":null},{"id":"column-76","object_id":"column-76","name":"Name","name_without_path":"Name","description":null,"is_pk":false,"is_identity":false,"data_type":"varchar","data_length":"100","is_nullable":false,"computed_formula":null,"default_value":null,"path":null,"level":1,"item_type":"COLUMN","is_user_defined":false,"custom_fields":{},"linked_terms":[],"references":[],"linked_lookup":null},{"id":"column-77","object_id":"column-77","name":"Course_Id","name_without_path":"Course_Id","description":null,"is_pk":false,"is_identity":false,"data_type":"int","data_length":null,"is_nullable":false,"computed_formula":null,"default_value":null,"path":null,"level":1,"item_type":"COLUMN","is_user_defined":false,"custom_fields":{},"linked_terms":[],"references":[{"id":"t22","name":"Course","name_show_schema":"dbo.Course"}],"linked_lookup":null}],"relations":[{"name":"FK_Topic_Course","title":null,"description":null,"is_user_defined":false,"foreign_table":"Topic","foreign_table_show_schema":"dbo.Topic","foreign_table_verbose":"Topic","foreign_table_verbose_show_schema":"dbo.Topic","foreign_table_object_id":"t16","primary_table":"Course","primary_table_show_schema":"dbo.Course","primary_table_verbose":"Course","primary_table_verbose_show_schema":"dbo.Course","primary_table_object_id":"t22","pk_cardinality":"1x","fk_cardinality":"mx","constraints":[{"primary_column_path":null,"primary_column":"Id","foreign_column_path":null,"foreign_column":"Course_Id"}],"custom_fields":{}}],"unique_keys":[{"name":"PK_Topic","description":null,"is_pk":true,"is_user_defined":false,"columns":[{"path":null,"name_without_path":"Id","name":"Id","column_id":75}],"custom_fields":{}}],"triggers":[],"dependencies":{"uses":[{"object_name":"Topic","object_name_show_schema":"dbo.Topic","object_type":"TABLE","object_id":"t16","type":"NORMAL","object_user_defined":false,"user_defined":false,"children":[{"object_name":"Course","object_name_show_schema":"dbo.Course","object_type":"TABLE","object_id":"t22","type":"RELATION","pk_cardinality":"1x","fk_cardinality":"mx","object_user_defined":false,"user_defined":false,"children":[]}]}],"used_by":[]},"object_id":"t16","name":"Topic","subtype":"TABLE","is_user_defined":false,"description":null,"summary":[{"field":"Documentation","value":{"_type":"link","name":"Examination_System_DATA_Dictionary","id":"d2"}},{"field":"Schema","value":"dbo"},{"field":"Name","value":"Topic"},{"field":"Type","value":"Table"}],"script":"","imported_at":"2025-02-01 01:12"};