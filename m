From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH 1/4] module: add syscall to load module from fd
Date: Thu, 03 Jan 2013 10:42:24 +1030
Message-ID: <87fw2j5dlj.fsf@rustcorp.com.au>
References: <1348179300-11653-1-git-send-email-keescook@chromium.org> <CAHO5Pa2fysDRS3sFSy785XBKApxydN0ONW5kAfVJNkrB+wOaBw@mail.gmail.com> <50749DE8.7010703@zytor.com> <CAKgNAkgLW+0aHwzoY6vxmeeK_K5w2RyhxW+jOaJDn274NVbajw@mail.gmail.com> <5074A0AB.8040207@zytor.com> <87d30o7iy6.fsf@rustcorp.com.au> <CAKgNAkh=99=x1=8Y=3odem-fXc9zEEbLvCc0WQku5Kyso4qHuQ@mail.gmail.com> <87ipa8o4mn.fsf@rustcorp.com.au> <CAKgNAkiVxUiqJ1pYNq3wW_yQxcyhqntUzcEWscFOhJ3GaVn1aQ@mail.gmail.com> <87sj97hs5e.fsf@rustcorp.com.au> <CAHO5Pa29_=3HNLG-qtULZ2fmkgPJ6JCZ0LTv9m=UowfvFufhMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHO5Pa29_=3HNLG-qtULZ2fmkgPJ6JCZ0LTv9m=UowfvFufhMw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, Lucas De Marchi <lucas.demarchi@profusion.mobi>, jonathon@jonmasters.org, Michael Kerrisk <mtk.manpages@gmail.com>, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Michael Kerrisk <mtk.manpages@gmail.com> writes:
> Hi Rusty,

Hi Michael,

> The description here is rather thin. Could you supply a sentence or
> two for each of MODULE_INIT_IGNORE_MODVERSIONS and
> MODULE_INIT_IGNORE_VERMAGIC that would be suitable for the manual
> page?
>
> Thanks,

There are one or two safety checks built into a module, which are
checked to match the kernel on module load.  The first is a "vermagic"
string containing the kernel version number and prominent features (such
as CPU type).  If the module was built with CONFIG_MODVERSIONS set, a
version hash is recorded for each symbol the module uses based on the
types it refers to: in this case, the kernel version number within the
"vermagic" string is ignored, as the symbol version hashes are assumed
to be sufficiently reliable.

Using the MODULE_INIT_IGNORE_VERMAGIC flag indicates that the vermagic
is to be ignored, and the MODULE_INIT_IGNORE_MODVERSIONS flag indicates
that the version hashes are to be ignored.  If the kernel is built to
permit such forced loading (ie. CONFIG_MODULE_FORCE_LOAD is set) then
loading will continue, otherwise it will fail with ENOEXEC as expected
for malformed modules.

Hope that is more usable?

Thanks,
Rusty,
