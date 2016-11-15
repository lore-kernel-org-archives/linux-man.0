From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/5] add_key.2: add information regarding EPERM
Date: Tue, 15 Nov 2016 21:17:52 +0000
Message-ID: <CACGkJduKzn3ZK2uet_eVPFRmQszCRZQRyUBOJ-GYe44zCuvzMA@mail.gmail.com>
References: <9a5cc2a7-a505-9d0d-5b78-4bc5ab100ff1@gmail.com>
 <20161115084440.GA21255@obsidian> <fc419c25-7e99-9b47-0439-3469bb6e9ed6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fc419c25-7e99-9b47-0439-3469bb6e9ed6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, Nov 15, 2016 at 9:00 PM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello Eugene
>
> On 11/15/2016 09:44 AM, Eugene Syromyatnikov wrote:
>> ---
>>  man2/add_key.2 | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/man2/add_key.2 b/man2/add_key.2
>> index 082a2b8..241eb92 100644
>> --- a/man2/add_key.2
>> +++ b/man2/add_key.2
>> @@ -183,6 +183,19 @@ The keyring doesn't exist.
>>  .TP
>>  .B ENOMEM
>>  Insufficient memory to create a key.
>> +.TP
>> +.B EPERM
>> +The
>> +.I type
>> +started from dot.
>
> Oh -- I was unaware of this! What are key types that start with "." about,
> do you know?
I can't recall any clear indication that this is for internal purposes
(and can't find any mention of this now), but there is explicit check
in keyctl.c:key_get_type_from_user and it is used for
".request_key_auth" key type. Judging by commit messages for 54e2c2c1,
1260f801 and 3e30148c, it is indeed reserved for internal purposes and
has been reserved as part of the introduction of the aforementioned
".request_key_auth" key type.

> Cheers,
>
> Michael
>
>
>> +.TP
>> +.B EPERM
>> +.I type
>> +was
>> +.I """keyring"""
>> +and the
>> +.I description
>> +started from dot.
>>  .SH VERSIONS
>>  This system call first appeared in Linux 2.6.10.
>>  .SH CONFORMING TO
>>
>
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/



-- 
Eugene "eSyr" Syromyatnikov
mailto:evgSyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
xmpp:eSyr@jabber.{ru|org}
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
