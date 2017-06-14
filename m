From: "Jason A. Donenfeld" <Jason-OnJsPKxuuEcAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] xcrypt.3: warn folks not to use these functions
Date: Wed, 14 Jun 2017 19:12:05 +0200
Message-ID: <CAHmME9oauM5taJ57csev=NqpBmxoBNjjRhXgEwucXi91-vYETw@mail.gmail.com>
References: <20170614170351.19509-1-Jason@zx2c4.com> <59416DA2.2070900@bfs.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <59416DA2.2070900-fPG8STNUNVg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wharms-fPG8STNUNVg@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Jun 14, 2017 at 7:08 PM, walter harms <wharms-fPG8STNUNVg@public.gmane.org> wrote:
> It would be helpful to mention an alternativ.

People who find this are presumably planning on using DES with this
horrible KDF. Are you recommending that I mention an entirely
different cryptosystem for people to use? Seeing as the libcs haven't
been stupid enough to entirely implement new cryptosystems and all
associated functions for many years, there's not a clear man page I
can just point to. I could rattle off some random primitives and
constructions that are good to use, but the devil is always in the
details, and people will still probably do it wrong.

I think a "stop, go away" might be the best approach here.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
