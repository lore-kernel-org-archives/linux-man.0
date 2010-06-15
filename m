From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Unable to parse a sentence in sync_file_range.2
Date: Tue, 15 Jun 2010 06:59:57 +0200
Message-ID: <AANLkTingOWwxbexef-fqmSfGyDgmPiPR4o0WJsEkg9gO@mail.gmail.com>
References: <7b3bdec71002181532o4ed24f53j121c3923ea7fa8df@mail.gmail.com>
	<cfd18e0f1002210534x54997e93g3e9323e678e22cb9@mail.gmail.com>
	<AANLkTilxmxNTK9Q7B0dH9v1XH7CAUCrdcw-qFgi4yzLG@mail.gmail.com>
	<20100614074737.GA27379@infradead.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100614074737.GA27379-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Christoph,

On Mon, Jun 14, 2010 at 9:47 AM, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> =
wrote:
>> >> ?When writing into preallocated space, many filesystems also
>> >> ?require calls into the block allocator, which this system
>> >> ?call does not sync out to disk.
>> >>
>> >> Can someone please rephrase it? ?In particular, what does 'which'=
 refer to?
>> >> Thanks.
>
> How about:
>
> Usually filesystems also need to update metadata when writing into
> preallocated space. =A0This system call does not guarantee the persis=
tance
> of conversions from preallocated to regularly allocated space.

Personally, I'm still having a little trouble with the last sentence.
I think my failure may be one of technical understanding, rather than
a language problem. Could you try explaining in a different way,
perhaps with a few more words?

Thanks,

Michael



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
