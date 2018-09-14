select 
    m.text,
    case when maj.attachment_id is not NULL then 1
        else 0 end as has_attachment,
    case when m.is_from_me = 1 then 'James'
        else 'Jill' end as sender,
    m.date
from message m
    inner join chat_message_join cmj on m.ROWID = cmj.message_id
    inner join chat c on c.ROWID = cmj.chat_id
    inner join chat_handle_join chj on c.ROWID = chj.chat_id
    inner join handle h on h.ROWID = chj.handle_id
        and h.id like '+1914%'
    left join message_attachment_join maj on m.ROWID = maj.message_id