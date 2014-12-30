From: "Carlos O'Donell" <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>
Subject: Re: [PATCH] getlogin.3: Reformat thread-safety information
Date: Tue, 30 Dec 2014 09:39:54 -0500
Message-ID: <CAE2sS1gqCFvpitcMv16jRN6zjE_e5nZZh4B=sHKof_ZoYy_Wjw@mail.gmail.com>
References: <1413518358-32200-1-git-send-email-penght@cn.fujitsu.com>
	<5440B1A9.8020304@gmail.com>
	<5440B745.9020003@cn.fujitsu.com>
	<5440BC77.3040906@gmail.com>
	<CAE2sS1gRBH=Xw671FRynxCYej7uhYTuJ4pxXC0+6_s78VGJayQ@mail.gmail.com>
	<544FFDC1.2040300@gmail.com>
	<54A2AA8B.3090706@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54A2AA8B.3090706-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, Dec 30, 2014 at 8:37 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Ping on my question at the end of this mail.
>> By the way, how will the glibc manual maintain this info going forward?
>> Alexandre did great work, but I suppose he will not want to do this
>> forever! How will updates be made in the future? I ask because, of
>> course, man-pages has a similar issue ;-).

You are correct that Alexandre is not responsible for everything to do
with the safety notations. I want Alex to step back and let the
community step in to support the annotations.

The information will be maintained on a per-function basis as all of
the manual has been maintained.

Developers changing functions must change the notations in the manual for now.

The goal is actually to move to annotations into the source and
extract them from the source to generate the manual. However this
process is complicated by the change in license from LGPLv2 to GFDL.
This same problem exists in GCC and there it is easily fixed by having
someone from the community become an authorized relicensing person for
the purpose of a fixed set of files that need synchronization between
LGPLv2 and GFDL. For example the source could generate a file entirely
full of macros that the texinfo references.

The more interesting question is, could we use this LGPLv2 file in the
linux man pages to keep the glibc-based information in sync?

It is questionable if this information is even copyrightable, so
perhaps the generated file will have no copyright notice nor license
and can be used by both projects?

What do you think?

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
