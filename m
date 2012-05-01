From: KOSAKI Motohiro <kosaki.motohiro@gmail.com>
Subject: Re: [PATCH] Describe race of direct read and fork for unaligned buffers
Date: Tue, 1 May 2012 12:15:11 -0400
Message-ID: <CAHGf_=qqiast+6XzGnq+LRdFXoWG9h2MkofmjS1h5OeNPRyWfw@mail.gmail.com>
References: <1335778207-6511-1-git-send-email-jack@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1335778207-6511-1-git-send-email-jack@suse.cz>
Sender: owner-linux-mm@kvack.org
To: Jan Kara <jack@suse.cz>
Cc: Michael Kerrisk <mtk.manpages@gmail.com>, LKML <linux-kernel@vger.kernel.org>, linux-man@vger.kernel.org, linux-mm@kvack.org, mgorman@suse.de, Jeff Moyer <jmoyer@redhat.com>
List-Id: linux-man@vger.kernel.org

> +suffices. However, if the user buffer is not page aligned and direct rea=
d

One more thing. direct write also makes data corruption. Think
following scenario,

1) P1-T1 uses DIO write (and starting dma)
2) P1-T2 call fork() and makes P2
3) P1-T3 write to the dio target page. and then, cow break occur and
original dio target
    pages is now owned by P2.
4) P2 write the dio target page. It now does NOT make cow break. and
now we break
    dio target page data.
5) DMA transfer write invalid data to disk.

The detail is described in your refer URLs.


> +runs in parallel with a
> +.BR fork (2)
> +of the reader process, it may happen that the read data is split between
> +pages owned by the original process and its child. Thus effectively read
> +data is corrupted.
> =A0.LP
> =A0The
> =A0.B O_DIRECT

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Fight unfair telecom internet charges in Canada: sign http://stopthemeter.ca/
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
