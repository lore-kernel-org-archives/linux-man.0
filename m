Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792774245;
	b=0UMSAomCmxf7YhF1re4tPAvGePjLOotvPnvcc+K85w9MqSxVghwUbH9z5JyEsnQcyOWh
	 NpysoqpLuPnRIEDSyrC1hfGeO4OA/mrJ17ZXj2Fv06+pFt5yF1FYbufZC29VASsGWeWqC
	 gjQCha51GI7DkOJMKCXiWv+jHDU4dDttdi+leGte94EuBWxG/ItcW3N5muvTE+qHCy/C+
	 EPSSS8ElzTVfeoscDS+eDdrpl5pVSWAXJt79UTV3Mu0p0o/J0ZqKZ1tq2RvEfUHsGXhPz
	 cQEpTSjPrR045YF8EjGxDsfbulKEq11EGbCPxbi3CHNyF7Qdm0O2rsLkHXDXLYVqtYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792774245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=zh1SHkERrz4Ve7nY6G+JVpwWPhextZe4krk8AvhiX9o=;
	b=JXfU+o7+i09I0jRtWx9rpB/2qbJ9tTzVyOx8NlwOYR89iCVO6Cq4ANnrLv4sTtBNz1v4
	 dXzMx7APFutX5fDTGEaLhMzya9wEhw2xWPN3/RVPXXN1hyc7JRU1/fx0Nd+aIHdV0fKsU
	 d4gymru2ZT1SWVhIe/XQMQkITE2C9vEIxgxI48BJTuMGgHfYnt4sEkR3feHRreQS7+R08
	 6I6WMy6OnmIXfVzMTr7aipqOjgXufget4VxKJY3xUH3rzEPGqECBAXLYKogJ+UScvnmfR
	 tyC1ihm+eEsQWZcC5iJZgeqTHxBikIjevp0QhYKMwHb+itJgXwx0lVA+eWDHKHKo4zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mBNcm1wz;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1288606A31A
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 16:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1288606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mBNcm1wz
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso11190155e9.2
        for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 09:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792774243; x=1793379043; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zh1SHkERrz4Ve7nY6G+JVpwWPhextZe4krk8AvhiX9o=;
        b=mBNcm1wzfzAcQiNjUDPU71RscW+xcmx6JnaBmEsvqip5HpKZ4s6crLrwpOjHz+lSJL
         uY6buhNibV+KG4JlPvc+ornjcxRpDUNKZsJgw9myeb4u291Ssw88us5+hG8+EmWJPbAL
         fhbzEAKawHPsq+E8fRXydtqT1ELoKp2PSB2fg31/3jy/RoSBTA0RHDD/xD+wQBzYNPT9
         TpeLhn21zvPf1WgirAb67BIH6yigLOCNFepHsCkgWpk2ijVgIpP1765Fl8PVZlitPZtB
         CJqDxc2BgbrxL/hP/5a6xXtQUbg8LfBTB6RX0gwZdR3VHGrsHhr889Vm+I/0dXYDD8D2
         pjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792774243; x=1793379043;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zh1SHkERrz4Ve7nY6G+JVpwWPhextZe4krk8AvhiX9o=;
        b=1EO7Fj2+7O4MPjr3LPrAaefXbOfFG19YJ3NRsIW2oGM4TbQ8b2LVI3RS40kpB9pf3z
         7xnRfue8tThl2ITterMJp/SGaI1ji0/qwczBL3Oy3Eho5lgCb5ml+iv7vwq0PhrIHzJO
         Ixxz418X3XvPls3M4nJbjb2iLOailTk5+3n4roZsfSRaT6DkjuNaDzYqTHg6rXGQGvkK
         MHiQSr3F3sQTYjanNYaRaJMLA2fu9gmU2vyIaw83pRBINy5mkWlDZMBbtSeVjaRg4V7p
         Ft5Df2f7+Dg9bTD2AoYx5KPRPIdA/ZCsYS4Vv8EIJGCEhyG5imyhf4f/xRq+S830L9/7
         p2nA==
X-Gm-Message-State: AFq9FYJTsWJXRg0il2N3xwiSsQrtntHC+LBir//CPZP0So1HQl1xHwI/
	5pXuD6THh6WFspKcIfJptZ5dDjEvfh3Gft9PqxKpfML7ve8hz6f/PHxw
X-Gm-Gg: AYBFou2EyPjWLn7YjOvLa9/48Q9ExVsexDt3TAeAVPnF+YAhvm43J0UFP4II5xBvHWM
	PbjA0HX2nWX4yZGjBov4P16TrBTDnNxB6CnBK89GvDKyIiKkCYj+JLz+lAIg5G3e0RsrjRs1VrW
	J7rn4lhjQrQ+c/tv/vu1UmkL5JyFR1sIaduRoxO7WuYh3TAVqK5PnWcjd9ouAddeEr381qSAEr4
	196lrVfq1Azu1scimT57rOz+Tr6W9ShLJeeVpF+FdgMW0sOfz1raiO4yeJyEBvbdb8HEBa2vOwc
	1zXPJKOqmDz1cp1qXO7OG46Ghx15t5rFX/aCL/fPX4US3LvPZQ93z7Bj7vg9FhU7JMFD6D++cUe
	6WDRjPhBNM2eCLyLLBN3Viq1zFY5mLRSrE6aYtLYXtpsR8CkGAyG5I3mnLtcfsERzLpPJ1/cmTj
	D2/QiSCtAIuQ88h48DEu5zuuCdp6hruufX0HWfUJWTRSimdX+/Kucf9SjuMFyOYrsQOhSbQZntz
	59rgh4u7JwTGPGQ2VZKPwLXkbR1A896DHDwlmKfqJncIUGTb8qxWIQXK4Fgi5IizkEQ8yLvWDEs
	K3xPXAkltMNW7z/9Fd8B5i/TVg==
X-Received: by 2002:a05:600c:34c9:b0:4a2:526b:d40c with SMTP id 5b1f17b1804b1-4a2526bd70emr19063875e9.5.1792774243014;
        Fri, 23 Oct 2026 09:50:43 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a312eafc80sm22314695e9.3.2026.10.23.09.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 09:50:42 -0700 (PDT)
Date: Fri, 23 Oct 2026 18:50:37 +0200
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>,
	Willy Tarreau <w@1wt.eu>, Kuniyuki Iwashima <kuniyu@google.com>
Subject: Re: [PATCH 1/7] man/man7/unix.7: ERRORS: ETOOMANYREFS: Fix the
 conditions
Message-ID: <20261023.c8e083cf7e00@gnoack.org>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
 <20261021212256.27961-2-gnoack3000@gmail.com>
 <atp8BcbYwm9iJiw3@debian>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atp8BcbYwm9iJiw3@debian>

On Thu, Oct 22, 2026 at 11:14:09PM +0200, Alejandro Colomar wrote:
> > diff --git a/man/man7/unix.7 b/man/man7/unix.7
> > index 79198445c581..0d2ea8bda2ae 100644
> > --- a/man/man7/unix.7
> > +++ b/man/man7/unix.7
> > @@ -785,10 +785,14 @@ when sending a file descriptor as ancillary data over
> 
> Would you mind having a look at CONTRIBUTING.d/git for improving the
> hunk context?
> 
>     git-diff(1), gitattributes(5)
> 	To produce useful hunk contexts in manual pages, we need to hack
> 	git(1)'s idea of a function name, and also to tell git what is a
> 	manual page.
> 
> 		$ git config --global diff.man.xfuncname '^\.S[SHsh] .*$';
> 		$ mkdir -p ~/.config/git/;
> 		$ echo '*.[0-9]* diff=man' >>~/.config/git/attributes;

Nice trick!  Applied.

–Günther
