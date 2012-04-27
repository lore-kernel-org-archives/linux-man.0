From: Jakub Jelinek <jakub@redhat.com>
Subject: Re: malloc_info(3) man page for review
Date: Fri, 27 Apr 2012 09:35:52 +0200
Message-ID: <20120427073552.GU6148@sunsite.ms.mff.cuni.cz>
References: <CAKgNAki-o30f4NfBOa1wJ7Ro=OaE77yHeci5Svk2KaEoQPKffg@mail.gmail.com>
Reply-To: Jakub Jelinek <jakub@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <libc-alpha-return-28056-glibc-alpha=m.gmane.org@sourceware.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAki-o30f4NfBOa1wJ7Ro=OaE77yHeci5Svk2KaEoQPKffg@mail.gmail.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: linux-man <linux-man@vger.kernel.org>, libc-alpha@sourceware.org
List-Id: linux-man@vger.kernel.org

On Fri, Apr 27, 2012 at 03:59:58PM +1200, Michael Kerrisk (man-pages) wrote:
> Gidday,
> 
> I've written the man page page below to document glibc's
> malloc_info(3). Review comments welcome!

I think it would be nice to mention there that e.g. open_memstream (or
fmemopen) could be used to store the XML output into a buffer in the
program rather than into some file.  IMHO that is quite common thing and
thus could be hinted in the man page.

	Jakub
