From: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Subject: Re: Handling of updates to kernel Documentation/ tree
Date: Mon, 09 Mar 2015 17:16:37 +0100
Message-ID: <43211791.W2j9vX2NNy@tauon>
References: <3421611.4D45Q2BAys@tauon> <20150309150739.GA6131@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150309150739.GA6131-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Michael Kerrisk <michael.kerrisk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Am Montag, 9. M=E4rz 2015, 08:07:39 schrieb Christoph Hellwig:

Hi Christoph,

>On Mon, Mar 09, 2015 at 03:17:58PM +0100, Stephan Mueller wrote:
>> Hi Michael,
>>=20
>> how shall an update to the Documentation/ tree be handled in man
>> pages
>> that contain a pointer to these documents?
>>=20
>> Specifically, socket(2) contains a reference to
>> Documentation/crypto/crypto-API-userspace.txt. With the patch [1] th=
e
>> document is gone and its contents is moved into a DocBook.
>>=20
>> Shall the kernel DocBook website [2] be referenced? If so, when is i=
t
>> appropriate to add the patch (note, the change is expected to be
>> propagated to Linus' tree in 4.1-rc1).
>
>Referencing a kernel Documentation file from a man page sounds like
>a bad idea to me.  Why can't we include a nroff-yfied version of the
>content in the man-pages repository?

You can see the compiled output at [1]. You see that the output is=20
larger. Of course I can provide a patch of the output from make mandocs=
=20
of that DocBook. I would think that this documentation is too large to=20
be put into socket(2).

The only proposal I would have is to format the output into a separate=20
man page for chapter 4.

[1] http://www.chronox.de/crypto-API/User.html


Ciao
Stephan
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
