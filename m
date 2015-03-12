From: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Subject: Re: Handling of updates to kernel Documentation/ tree
Date: Thu, 12 Mar 2015 10:56:07 +0100
Message-ID: <1506795.aItdcJcpob@tauon>
References: <3421611.4D45Q2BAys@tauon> <20150309174057.GC12857@vapier> <20150310141104.GA17228@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150310141104.GA17228-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Michael Kerrisk <michael.kerrisk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Am Dienstag, 10. M=E4rz 2015, 07:11:04 schrieb Christoph Hellwig:

Hi Christoph,

>On Mon, Mar 09, 2015 at 01:40:57PM -0400, Mike Frysinger wrote:
>> > Referencing a kernel Documentation file from a man page sounds lik=
e
>> > a bad idea to me.  Why can't we include a nroff-yfied version of
>> > the
>> > content in the man-pages repository?
>>=20
>> isn't that way worse ?  now we have to keep the man pages git repo i=
n
>> sync with the kernel Documentation/ subtree.
>
>The content really should not change that much for public APIs.
>
>> i think having the man pages refer to the public docbook kernel.org
>> pages should be fine.
>
>Pointing to kernel.org posted html renderings sounds perfectly fine to
>me.  The reference to files inside a kernel source tree is what I
>object to.
>--
>To unsubscribe from this list: send the line "unsubscribe linux-man" i=
n
>the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html

If this is the consensus, then I will wait with a patch to the man page=
=20
until the code is merged into Linus' tree and the DocBook at kernel.org=
=20
is updated.

The patch will then refer to the precise kernel.org web page.


Ciao
Stephan
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
