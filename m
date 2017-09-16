From: Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: dl_iterate_phdr(3) needs clarification
Date: Sat, 16 Sep 2017 23:28:44 +0800
Message-ID: <20170916152842.GG13267@HP.internal.baidu.com>
References: <20170915084423.GB317@HP.internal.baidu.com>
 <CAKgNAkhRo04hCoYX+SCKEr7Ai0zT9HcV_z-aZhCio+CQqO+eHw@mail.gmail.com>
 <20170916150053.GD13267@HP.internal.baidu.com>
 <480b07c2-b897-b175-036a-e304b2bba2d1@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <480b07c2-b897-b175-036a-e304b2bba2d1-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, vivek-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Florian,

On Sat, Sep 16, 2017 at 10:15:19AM +0200, Florian Weimer wrote:
> On 09/16/2017 05:00 PM, Yubin Ruan wrote:
> >diff --git a/man3/dl_iterate_phdr.3 b/man3/dl_iterate_phdr.3
> >index b5b75e8..35107da 100644
> >--- a/man3/dl_iterate_phdr.3
> >+++ b/man3/dl_iterate_phdr.3
> >@@ -121,10 +121,9 @@ header files.)
> >  .PP
> >  The
> >  .I dlpi_addr
> >-field indicates the base address of the shared object
> >-(i.e., the difference between the virtual memory address of
> >-the shared object and the offset of that object in the file
> >-from which it was loaded).
> >+field indicates the base address that is mapped at runtime.
> >+For an executable this field is always 0 and for a shared
> >+object it is the address where the shared object is mapped.
> 
> The part about executables is not true.  The most common case probably is
> PIE executables.  You see this if you compile the modified test program with
> -fpie -pie on a recent enough toolchain.

-fpie only affect address of PT_LOAD. The one inidcated by `dlpi_addr' is
always 0 for an executable. Yes there is indeed some confusion, see [1].

Yubin

[1]: https://stackoverflow.com/questions/8875876/getting-the-elf-header-of-the-main-executable
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
