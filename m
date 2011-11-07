From: Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>
Subject: Re: [PATCH/RFC 0/6] ld.so.8: some improvements from Debian
Date: Mon, 7 Nov 2011 08:41:38 +0000
Message-ID: <CAOnWdoiomYnHN5z9PRpCSjpzmQy3yo-56JSOD3_E_PDnWgKs=w@mail.gmail.com>
References: <20111020070037.GA11392@elie.hsd1.il.comcast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111020070037.GA11392-E4JsH6yu/ca99If2fRKg35Ea+QML8DWm@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>, Aurelien Jarno <aurelien-rXXEIb44qovR7s880joybQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Sorry I took so long to get around to reviewing this. Some comments:

-       /lib/ld-linux.so.*  [OPTIONS] [PROGRAM [ARGUMENTS]]
+       /lib/ld-linux.so.*  [--list] [--verify] [--library-path
+       paths] [--inhibit-rpath objects] [--audit auditors] program
+       [arg...]

Unless the options to a program are very short, I don't like to see
them all listed in a synopsis, as it's too long-winded.

Also, I prefer upper-case for metasyntactic variables in man pages. So
in fact, the original is fine, though I do like ellipsis to indicate
multiple arguments, so:

-       /lib/ld-linux.so.*  [OPTIONS] [PROGRAM [ARGUMENTS]]
+       /lib/ld-linux.so.*  [OPTION...] [PROGRAM [ARGUMENT...]]

I don't think the phrase '"turn-key"' is helpful here; I'd remove it.

+       hardware capabilities such as /usr/lib/sse2/. The dynamic

Insert comma after "hardware capabilities".

+       CPU. The following names are currently recognized: Alpha ev4,
+       ev5, ev56, ev6, ev67

Insert para break before "Alpha".

+              multiple version of the same library is

version =E2=86=92 versions

--=20
http://rrt.sc3d.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
