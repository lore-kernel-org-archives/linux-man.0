From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/5] request_key.2: add information regarding default
 keyring
Date: Mon, 19 Dec 2016 09:47:14 +0100
Message-ID: <f06829ea-1d7c-3f9a-1f4b-e6880aacbdc2@gmail.com>
References: <6df2c812-c2d6-321c-902f-93b4d3aaa953@gmail.com>
 <528b203d-ac72-e4a6-8517-e8c5c11055a4@gmail.com>
 <20161121205940.GA16505@obsidian> <15546.1482135577@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <15546.1482135577-S6HVgzuS8uM4Awkfq6JHfwNdhmdF6hFW@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/19/2016 09:19 AM, David Howells wrote:
> Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
>>        Otherwise,  if  dest_keyring is 0 and a new key is constructed, the new
>>        key will be linked to the "default" keyring.  More precisely, when  the
>>        kernel  tries  to  determine to which keyring the newly constructed key
>>        should be linked, it tries the following keyrings, beginning  with  the
>>        keyring  set  via  the  keyctl(2) KEYCTL_SET_REQKEY_KEYRING command and
>>        continuing in the order shown below until it finds  the  first  keyring
>>        that exists:
>>
>>        ·  The   requestor  keyring  (KEY_REQKEY_DEFL_REQUESTOR_KEYRING,  since
>>           Linux 2.6.29).
> 
> This is only available in the /sbin/request-key upcall, where it refers back
> to the destination keyring of whoever called request_key().

Eugene has sent a longer analysis, which I didn't yet scan thoroughly.
But, I feel like I must be missing something obvious. (And unfortunately, my
FIXME text was a bit garbled). Here, we're talking about the situation where
request_key(2) is called with a destination keyring argument (final argument 
to the call) that is 0. Does not KEY_REQKEY_DEFL_REQUESTOR_KEYRING then yield
"0" as its value, and thus this case is a no-op in the list of keyrings searched?.
(Is there something here that I'm missing to do with chained upcalls?)

>>        ·  The    session    keyring    for    the    process's     user     ID
>>           (KEY_REQKEY_DEFL_USER_SESSION_KEYRING).  This keyring is expected to
>>           always exist.
>>
>>           ┌─────────────────────────────────────────────────────┐
>>           │FIXME                                                │
>>           ├─────────────────────────────────────────────────────┤
>>           │Are there circumstances where  the  session  keyring │
>>           │does not exist?  What are they?                      │
>>           └─────────────────────────────────────────────────────┘
> 
> The session keyring does not exist in /sbin/init's process, for example,
> unless that process created one.  It's existence or non-existence is then
> inherited by all the processes that are started from that.  Upon a log-in, PAM
> is expected to create a session keyring.
> 
>>        ·  The   UID-specific   keyring  (KEY_REQKEY_DEFL_USER_KEYRING).   This
>>           keyring is also expected to always exist.
>>
>>           ┌─────────────────────────────────────────────────────┐
>>           │FIXME                                                │
>>           ├─────────────────────────────────────────────────────┤
>>           │Are  there  circumstances  where  the   UID-specific │
>>           │keyring does not exist?  What are they?              │
>>           └─────────────────────────────────────────────────────┘
> 
> The uid keyrings don't exist until someone tries to access them - at which
> point they're both created.  

Does "access" here mean attempt to "read ow update" the keyring, or are the
UID keyring created only on the first attempt to "update: them?

Cheers,

Michael

> When you log in, pam_keyinit creates a link to
> your user keyring in the session keyring it just created, thereby creating the
> user and user-session keyrings.
> 
> David
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
