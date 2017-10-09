From: Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: dl_iterate_phdr(3) needs clarification
Date: Mon, 9 Oct 2017 17:13:27 +0800
Message-ID: <20171009091325.GB5758@HP>
References: <20170915084423.GB317@HP.internal.baidu.com>
 <CAKgNAkhRo04hCoYX+SCKEr7Ai0zT9HcV_z-aZhCio+CQqO+eHw@mail.gmail.com>
 <20170916150053.GD13267@HP.internal.baidu.com>
 <480b07c2-b897-b175-036a-e304b2bba2d1@redhat.com>
 <20170916152842.GG13267@HP.internal.baidu.com>
 <45f4e59c-3be5-6edd-12a8-f158002dafc7@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <45f4e59c-3be5-6edd-12a8-f158002dafc7-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, vivek-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Florian,
sorry for the late reply. This mail got hidden in some secret mailbox and I
didn't discover it. sorry ;-(

On Sat, Sep 16, 2017 at 10:38:44AM +0200, Florian Weimer wrote:
> On 09/16/2017 05:28 PM, Yubin Ruan wrote:
> 
> > > The part about executables is not true.  The most common case probably is
> > > PIE executables.  You see this if you compile the modified test program with
> > > -fpie -pie on a recent enough toolchain.
> > 
> > -fpie only affect address of PT_LOAD. The one inidcated by `dlpi_addr' is
> > always 0 for an executable. Yes there is indeed some confusion, see [1].
> 
> I get this with your patched example:
> 
> Address: 0x156927e000, name: "" (9 segments)

Indeed, this still needs to be investigated some more. I will come back for
this late. Do you have any idea about the wording? I would like to hear your
understanding.

Yubin
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
