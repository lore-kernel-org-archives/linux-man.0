From: Thomas Jarosch <thomas.jarosch-XXsH3GEs1jrby3iVrkZq2A@public.gmane.org>
Subject: Re: [man-pages PATCH] Add note about calling fclose(NULL)
Date: Thu, 31 Jan 2013 09:26:03 +0100
Message-ID: <3571094.25JfT3zTrV@storm>
References: <1695270.M7m4ekngnN@storm> <CAKgNAkiQsWWWTfLWeixN5+GcwkfP6UX+AYdL4HY6beq7rdpUxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkiQsWWWTfLWeixN5+GcwkfP6UX+AYdL4HY6beq7rdpUxw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thursday, 31. January 2013 01:50:49 Michael Kerrisk wrote:
> > diff --git a/man3/fclose.3 b/man3/fclose.3
> > index 1bdf0a5..6945e89 100644
> > --- a/man3/fclose.3
> > +++ b/man3/fclose.3
> > @@ -97,6 +97,10 @@ on disk the kernel buffers must be flushed too, for
> > example, with> 
> >  .BR sync (2)
> >  or
> >  .BR fsync (2).
> > 
> > +Also it's undefined behavior to call
> > +.BR fclose ()
> > +with a NULL pointer.
> > +
>
> Could you supply some explanation of why you think this patch is required?

I always thought fclose(NULL) behaves like free(NULL)
and even sent a patch for the "perf" utility assuming this.
Luckily Arnaldo caught the error before applying the patch,
at least in one case.

Also fclose(NULL) "works" fine on HP-UX and Solaris,
glibc will die with a segfault.

Cheers,
Thomas

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
