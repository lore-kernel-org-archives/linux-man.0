From: "Carlos O'Donell" <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>
Subject: Re: [PATCH] getlogin.3: Reformat thread-safety information
Date: Tue, 30 Dec 2014 16:22:57 -0500
Message-ID: <CAE2sS1jscxqD+T5--M_0A4qAdF1pWA51YFZ=cxx8ucHQfPLCAg@mail.gmail.com>
References: <1413518358-32200-1-git-send-email-penght@cn.fujitsu.com>
	<5440B1A9.8020304@gmail.com>
	<5440B745.9020003@cn.fujitsu.com>
	<5440BC77.3040906@gmail.com>
	<CAE2sS1gRBH=Xw671FRynxCYej7uhYTuJ4pxXC0+6_s78VGJayQ@mail.gmail.com>
	<54460FB4.40906@cn.fujitsu.com>
	<544FFE19.3040503@gmail.com>
	<54A2AB1A.3040207@gmail.com>
	<CAE2sS1icKhKdiT28s=5SiODeKax7s0LhHMn-pEF3ED_p6jMX7w@mail.gmail.com>
	<CAKgNAkjD2kAczQxH_hs7nx+GNT7uiVhxiBKOj2WV8qdgn45GXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjD2kAczQxH_hs7nx+GNT7uiVhxiBKOj2WV8qdgn45GXw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, Dec 30, 2014 at 3:39 PM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Maybe you have misunderstood my point. I don't expect Peng Haitao and
> his colleagues to repeat Alexandre's work, but I am hoping that he
> might compare the glibc annotations with the man-pages annotations,
> and account for the differences/make fixes as needed.

Indeed. I did misundertand your question. Comparing the glibc manual
with the linux kernel man pages is a shorter project.

Relevant to the review is that not all functions are documented in both places.

I would be interested in seeing which functions are documented in one
but not the other, and which functions lack documentation completely
e.g. dlmopen.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
