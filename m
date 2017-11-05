From: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: pkey_alloc/pkey_free semantics
Date: Sun, 5 Nov 2017 12:39:05 +0100
Message-ID: <53ca4117-3694-45ac-3433-c9d3456e096b@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

I'm implementing the memory protection key interfaces for glibc and 
noticed that the pkey_alloc manpage in particular is a bit removed from 
reality.

Here's what I found:

The flags argument is reserved and currently must be zero.

The access_rights argument instructs the kernel to set the access rights 
for the new key for the current thread only (!).  It's a bitmask with 
bits PKEY_DISABLE_ACCESS and PKEY_DISABLE_WRITE.

So in essence, both arguments are not needed right now because the 
access rights of the current thread for the new key could easily be 
changed in user space.

To repeat, pkey_alloc affects the access rights of the current thread. 
Other threads retain their existing access rights.  The default rights 
for the process apparently can be set with the init_pkru parameter on 
recent kernels (I have not tried that).

The manpage mentions only the key leak related to pkey_mprotect 
(pkey_free while a page still is still associated with that key).  There 
is another one which affects a pkey_alloc/pthread_create/pkey_free 
sequence, where any created threads retain their access rights.  I 
raised this issue of key reuse in a recent thread (MPK: pkey_free and 
key reuse), so perhaps there will be a way

Anyway, the important manpage fix for now would be to fix the 
description of the flags and access_rights parameters.

Thanks,
Florian
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
