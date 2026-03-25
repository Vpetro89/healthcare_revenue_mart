select
    trim(load_batch_id) as load_batch_id,
    upper(trim(source_system)) as source_system,
    trim(feed_name) as feed_name,
    try_to_date(load_date) as load_date,
    try_to_number(expected_record_count) as expected_record_count,
    try_to_number(actual_record_count) as actual_record_count,
    try_to_number(rejected_record_count) as rejected_record_count,
    try_to_number(qa_exception_count) as qa_exception_count,
    upper(trim(load_status)) as load_status,
    upper(trim(checksum_status)) as checksum_status,
    upper(trim(sla_met_flag)) as sla_met_flag,
    trim(notes) as notes
from {{ ref('source_load_audit') }}
