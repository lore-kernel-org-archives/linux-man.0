From: "Zhen Ren" <zren-IBi9RG/b67k@public.gmane.org>
Subject: Re: "man 3 vsprintf" : simple bug in EXAMPLE section
Date: Fri, 27 Mar 2015 03:52:09 -0600
Message-ID: <5515C2F9020000D400069A6F@relay2.provo.novell.com>
References: <551584DE020000D400069A4C@relay2.provo.novell.com>
 <CAKgNAkjY=YpuZ7ifA1HCN68jZZ_PgFRw4KYfKaXeViPAvs+m+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjY=YpuZ7ifA1HCN68jZZ_PgFRw4KYfKaXeViPAvs+m+w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

I'm so sorry for this negative report.

Yeah, you're right. It'll fall through,loop again,do "vsprintf" and return if done.

--
Best regards,
Eric, Ren
HA team, SUSE


>>> 
> Hello Zhen Ren, 
>  
> On 27 March 2015 at 06:27, Zhen Ren <zren-IBi9RG/b67k@public.gmane.org> wrote: 
> > Hi, 
> > There is simple bug in EXAMPLE section of "man 3 vsprintf". 
> > 
> > Function will return nothing if  it steps into the last "else {}". 
> > 
> > ------------------ example code ----------------- 
> >  char * 
> >        make_message(const char *fmt, ...) 
> >        { 
> >            int n; 
> >            int size = 100;     /* Guess we need no more than 100 bytes */ 
> >            char *p, *np; 
> >            va_list ap; 
> > . 
> > .cut off 
> > . 
> >                np = realloc(p, size); 
> >                if (np == NULL) { 
> >                    free(p); 
> >                    return NULL; 
> >                } else { 
> >                    p = np; 
> > +                return p; 
> >                } 
> >            } 
> >        } 
>  
> I have not looked too closely at the code, but the above report 
> appears incorrect to me. The function should NOT be returning at that 
> point. It should be falling through and then round the loop once more. 
> If I've missed something, could you elaborate a little more on the 
> problem, please? 
>  
> Cheers, 
>  
> Michael 
>  
>  


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
