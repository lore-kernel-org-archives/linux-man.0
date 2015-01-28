From: Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Edited kexec_load(2) [kexec_file_load()] man page for review
Date: Wed, 28 Jan 2015 09:48:03 -0500
Message-ID: <20150128144803.GC15342@redhat.com>
References: <545FBDDD.9060801@gmail.com> <20141111213037.GA31445@redhat.com>
 <54ADA284.30502@gmail.com> <20150112221634.GD16162@redhat.com>
 <54B91271.3000600@gmail.com> <20150127142459.GA12851@redhat.com>
 <54C89816.8030709@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kexec-bounces+glkk-kexec=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54C89816.8030709-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kexec>,
 <mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kexec/>
List-Post: <mailto:kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kexec>,
 <mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "kexec" <kexec-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: kexec-bounces+glkk-kexec=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Dave Young <dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Jan 28, 2015 at 09:04:38AM +0100, Michael Kerrisk (man-pages) wrote:

Hi Michael,

[..]
> >> * the number of bytes copied from userspace is min(bufsz, memsz)
> > 
> > Yes. bufsz can not be more than memsz. There is a check to validate
> > this in kernel.
> > 
> > 	result = -EINVAL;
> > 	for (i = 0; i < nr_segments; i++) {
> > 		if (image->segment[i].bufsz > image->segment[i].memsz)
> > 			return result;
> > 	}
> 
> Okay. So it's more precise to leave discussion of min(bufz, memsz) 
> out of the man page just to say: bufsz bytes are transferred; 
> if bufsz < memsz, then the excess bytes in the target region are 
> filled with zeros. Right?

Sounds good.

[..]
> > Both mem and memsz need to be page aligned.
> 
> And the error if not is EADDRNOTAVAIL, right?

Yes.

> 
> >> And one further question. Other than the fact that they are used with 
> >> different system calls, what is the difference between KEXEC_ON_CRASH 
> >> and KEXEC_FILE_ON_CRASH?
> > 
> > Right now I can't think of any other difference. They both tell respective
> > system call that this kernel needs to be loaded in reserved memory region
> > for crash kernel.
> 
> Okay.
> 
> I've made various adjustments to the page in the light of your comments 
> above. Thanks!

Thank you for following it up and improving kexec man page.

Thanks
Vivek
