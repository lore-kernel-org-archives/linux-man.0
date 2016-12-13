From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Revised keyrings(7) man page for review
Date: Tue, 13 Dec 2016 13:43:28 +0100
Message-ID: <9f32a79b-5795-bff4-b741-bf927a525149@gmail.com>
References: <51643019-bb42-4066-c824-c55b9e668ac6@man7.org>
 <25262.1481628931@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <25262.1481628931-S6HVgzuS8uM4Awkfq6JHfwNdhmdF6hFW@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Michael Kerrisk <mtk-ASgREoAs3yw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, keyrings-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi David,

On 12/13/2016 12:35 PM, David Howells wrote:
> Michael Kerrisk <mtk-ASgREoAs3yw@public.gmane.org> wrote:
> 
>>        The  Linux key-management facility is primarily a way for driv‐
>>        ers to retain or  cache  security  data,  authentication  keys,
>>        encryption keys, and other data in the kernel.
> 
> No comma before "and".

I use/Linux man-pages uses the "Oxford comma" convention.

> 
>>        access to the facility.  See keyctl(1),  keyctl(3),  and  keyu‐
> 
> Ditto.  (And some other dittos).

See above.

>>               to the kernel when it was requested.   (Details  can  be
>>               found in request_key(2).)
> 
> How about dropping the brackets and making that last sentence "For further
> details, see request_key(2)."

Done.

>>               beyond the usual user, group, and other (see below).
> 
> I think this needs to say what below one is supposed to see:
> 
> "beyond the usual User, Group and Other (see 'Possession' below)."

Fixed.

>>    Key types
>>        The facility provides several basic types of key:
> 
> Again, I think the keyring type needs to go either first or last.

Fixed.

>>        "big_key" (since Linux 3.13)
>>               This  key type is similar to the "user" key type, but it
>>               may hold a payload of up to 1MiB in size.  The data  may
>>               be stored in the swap space rather than in kernel memory
> 
> stored encrypted (as of 4.8).

Added "encrypted".

> 
>>    Anchoring keys
>>        To prevent a key from being prematurely garbage  collected,  it
>>        must  anchored  to keep its reference count elevated when it is
>>        not in active use by the kernel.
> 
> I think "prematurely" is unnecessary here.

Fixed.

>>        (3) The search of the keyring tree is in preorder: each keyring
>>            is searched first for a match, then the  keyrings  referred
>>            to by that keyring are searched.
> 
> "preorder"?  How about "breadth-first order"?

Fixed.

>>               The  only keys included in the list are those that grant
>>               view permission to the reading  process,  regardless  of
>>               whether  or  not it possesses them.  LSM security checks
>>               are still performed, and may  filter  out  further  keys
>>               that the process is not authorized to view.
> 
> This is correct.  See proc_keys_show() in security/keys/proc.c:
> 
> 	rc = key_task_permission(key_ref, ctx.cred, KEY_NEED_VIEW);
> 	if (rc < 0)
> 		return 0;
> 
> Possibly it shouldn't be, but for now it is.

Okay -- thanks.


>>                      D   The key is dead (i.e., has been deleted).  (A
>>                          key  may  be  briefly  in  this  state during
>>                          garbage collection.)
> 
> No - "dead" in this context means that the key type was unregistered.

Okay, so the text should read as:

                     D   The key is dead (i.e., the key has been unregis‐
                         tered).  (A key may be  briefly  in  this  state
                         during garbage collection.)

Right?

> 
>>               Description
>>                      The key description (name).
>>
>>               Description
>>                      This field contains descriptive information about
> 
> Merge?

Yup. Already found and fixed that one.

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
