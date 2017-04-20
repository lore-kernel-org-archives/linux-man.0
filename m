From: Siddhesh Poyarekar <siddhesh@sourceware.org>
Subject: Re: Documenting the (dynamic) linking rules for symbol versioning
Date: Thu, 20 Apr 2017 18:28:12 +0530
Message-ID: <eb5bea0c-1f54-1b20-dc78-999160738ed3@sourceware.org>
References: <b3a962de-6703-d8b9-18f7-138185171475@gmail.com>
 <22f26755-f7f0-898a-ac74-3f6df92a22d7@sourceware.org>
 <c6736794-60bb-517e-0bcf-2e80331f0f72@gmail.com>
Reply-To: siddhesh@sourceware.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-78787-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <c6736794-60bb-517e-0bcf-2e80331f0f72@gmail.com>
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Cc: linux-man <linux-man@vger.kernel.org>, Carlos O'Donell <carlos@redhat.com>, Rich Felker <dalias@aerifal.cx>, "H.J. Lu" <hjl.tools@gmail.com>
List-Id: linux-man@vger.kernel.org

On Thursday 20 April 2017 06:10 PM, Michael Kerrisk (man-pages) wrote:
> I think that I have failed to provide enough detail for
> you to understand what I meant. Consider the following:
> 
> 1. We want to interpose some symbol in glibc (say, "malloc@GLIBC_2.0")
>    with a symbol of our own (perhaps via a preloaded library).
> 2. In our preloaded shared library, the interposing "malloc"
>    need not be a versioned symbol.
> 
> At least

Ah ok, got it.  The dlsym will result in picking up the latest symbol.

> Note the last line: dlsym() found xyz@@VER_2 (not xyz@VER_3).

Hmm interesting, I thought 'latest' would imply the last version in the
sequence of versions in the map, but I guess it kinda makes sense that
it is the @@ default, similar to how a static linker would pick it up.

Siddhesh
