From: "Daniel Anderberg" <daniel.anderberg-Qf6tv6/zH35g9hUCZPvPmw@public.gmane.org>
Subject: Error in return values section of page for random_r
Date: Tue, 19 Feb 2013 02:40:19 +0100
Message-ID: <20130219024019.174959n0f0si4lj7@www.fagotten.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

In the man-page for random_r and friends the return values section says:

    All of these functions return 0 on success, or -1 on error.

Since this includes the function random_r i must assume that this is  
incorrect.

My version of manpages:

$ dpkg -p manpages-dev | grep Version
Version: 3.35-0.1ubuntu1

Best wishes
Daniel Anderberg

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
