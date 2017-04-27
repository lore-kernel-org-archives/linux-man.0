From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: RFC: syscall(2), annotation
Date: Thu, 27 Apr 2017 12:55:05 +0200
Message-ID: <5901CE09.5010301@bfs.de>
References: <f3ef2be8-dfa5-e1dd-2315-d787a2a2acc3@gmail.com> <14390.1493206508@warthog.procyon.org.uk> <20170426155259.GY29622@ZenIV.linux.org.uk>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170426155259.GY29622-3bDd1+5oDREiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Al Viro <viro-3bDd1+5oDREiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org



Am 26.04.2017 17:53, schrieb Al Viro:
> On Wed, Apr 26, 2017 at 12:35:08PM +0100, David Howells wrote:
> 
>> AT_EMPTY_PATH wasn't there back in 2010.  I could eliminate the:
>>
>> 	statx(fd, NULL, 0, ...);
>>
>> option in favour of:
>>
>> 	statx(fd, "", AT_EMPTY_PATH, ...);
>>
>> Any thoughts either way, Al?
>>
>> It would seem that AT_EMPTY_PATH should be redundant, though, since you can
>> just set the pathname pointer to NULL.
> 
> NULL pathname pointer means an error for a lot of existing syscalls, so
> if you want to turn them into wrappers for ...at() ones at libc level,
> you'd need to do special-casing of NULL both kernel-side and in libc wrappers.
> 
> Requiring "" + AT_EMPTY_PATH means a single dereference of userland pointer.  
> OTOH, that's not a terrible burden...


perhaps this is something the manpage should mention ?
lately we had some changes in syscall:
Re: [PATCH] syscall(2): note parisc handling of aligned register pairs

I have no clue about NULL pointers in syscalls() but when we write that
"General: pathname" (i assume: char *) "NULLpointer mean an error for
existing syscalls".

This sounds right,




--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
