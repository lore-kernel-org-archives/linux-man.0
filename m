From: "Daniel Anderberg" <daniel.anderberg-Qf6tv6/zH35g9hUCZPvPmw@public.gmane.org>
Subject: Re: Error in return values section of page for random_r
Date: Tue, 19 Feb 2013 04:05:34 +0100
Message-ID: <20130219040534.15407biyh14yqtxa@www.fagotten.org>
References: <20130219024019.174959n0f0si4lj7@www.fagotten.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130219024019.174959n0f0si4lj7-wEvzQ7BQ6NBWDoOWyqc8uw@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Please forget my original email. The man-page is correct.
I apparently need to insert a coffebreak and one aditional readthrough  
before convincing myself that I have spotted an error.... I am very  
sorry that I have wasted your time.

Best Wishes
Daniel Anderberg

Quoting "Daniel Anderberg" <daniel.anderberg-Qf6tv6/zH35g9hUCZPvPmw@public.gmane.org>:

> Hello,
>
> In the man-page for random_r and friends the return values section says:
>
>    All of these functions return 0 on success, or -1 on error.
>
> Since this includes the function random_r i must assume that this is  
> incorrect.
>
> My version of manpages:
>
> $ dpkg -p manpages-dev | grep Version
> Version: 3.35-0.1ubuntu1
>
> Best wishes
> Daniel Anderberg
>



--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
