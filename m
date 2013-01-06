From: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/4] module: add syscall to load module from fd
Date: Sun, 6 Jan 2013 13:24:03 -0700
Message-ID: <CAGXu5jJXoYO3CzpENAZYANLzySPPjzDVO_qLonqwxUUu1Ux=sg@mail.gmail.com>
References: <1348179300-11653-1-git-send-email-keescook@chromium.org>
	<CAHO5Pa2fysDRS3sFSy785XBKApxydN0ONW5kAfVJNkrB+wOaBw@mail.gmail.com>
	<50749DE8.7010703@zytor.com>
	<CAKgNAkgLW+0aHwzoY6vxmeeK_K5w2RyhxW+jOaJDn274NVbajw@mail.gmail.com>
	<5074A0AB.8040207@zytor.com>
	<87d30o7iy6.fsf@rustcorp.com.au>
	<CAKgNAkh=99=x1=8Y=3odem-fXc9zEEbLvCc0WQku5Kyso4qHuQ@mail.gmail.com>
	<87ipa8o4mn.fsf@rustcorp.com.au>
	<CAKgNAkiVxUiqJ1pYNq3wW_yQxcyhqntUzcEWscFOhJ3GaVn1aQ@mail.gmail.com>
	<87sj97hs5e.fsf@rustcorp.com.au>
	<CAHO5Pa29_=3HNLG-qtULZ2fmkgPJ6JCZ0LTv9m=UowfvFufhMw@mail.gmail.com>
	<87fw2j5dlj.fsf@rustcorp.com.au>
	<CAKgNAkggu9+AuMRqTFeNy9sJVCMcZVRZx43t=svF=gm+P4DnuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkggu9+AuMRqTFeNy9sJVCMcZVRZx43t=svF=gm+P4DnuQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lucas De Marchi <lucas.demarchi-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org>, jonathon-Zp4isUonpHBD60Wz+7aTrA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, Jan 6, 2013 at 11:59 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Rusty, (and Lucas, and Kees)
>
> On Thu, Jan 3, 2013 at 1:12 AM, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org> wrote:
>> Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>>> Hi Rusty,
>>
>> Hi Michael,
>>
>>> The description here is rather thin. Could you supply a sentence or
>>> two for each of MODULE_INIT_IGNORE_MODVERSIONS and
>>> MODULE_INIT_IGNORE_VERMAGIC that would be suitable for the manual
>>> page?
>>>
>>> Thanks,
>>
>> There are one or two safety checks built into a module, which are
>> checked to match the kernel on module load.  The first is a "vermagic"
>> string containing the kernel version number and prominent features (such
>> as CPU type).  If the module was built with CONFIG_MODVERSIONS set, a
>> version hash is recorded for each symbol the module uses based on the
>> types it refers to: in this case, the kernel version number within the
>> "vermagic" string is ignored, as the symbol version hashes are assumed
>> to be sufficiently reliable.
>>
>> Using the MODULE_INIT_IGNORE_VERMAGIC flag indicates that the vermagic
>> is to be ignored, and the MODULE_INIT_IGNORE_MODVERSIONS flag indicates
>> that the version hashes are to be ignored.  If the kernel is built to
>> permit such forced loading (ie. CONFIG_MODULE_FORCE_LOAD is set) then
>> loading will continue, otherwise it will fail with ENOEXEC as expected
>> for malformed modules.
>>
>> Hope that is more usable?
>
> Yes, that helps. I did some reworking of that text. Hopefully, I did
> not introduce any errors.
>
> Below is the text that is proposed to document finit_module() in the
> man pages. I'd appreciate any review (Kees, Lucas, Rusty?)

Looks good to me!

Reviewed-by: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

-Kees

--
Kees Cook
Chrome OS Security
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
