Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B547333A00C
	for <linux-man@vger.kernel.org>; Sun, 11 Oct 2026 19:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791747854; cv=none; b=cwDslofAmi9xFelLoog7PcgniRROemOJ1X+VTSC8X2FTdeXMdzcoI1/RQqC7AqWQcXr2fBYiyBQxNn+pEXSpePh25iYI7jmVnBGVXhWENSbDm9AeTN71RY+4pbhlwlg0E8wA0irrJy3izpj7CAngqlla9Op579UEo1yaoYgEKng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791747854; c=relaxed/simple;
	bh=+uBOgq+K4wu/jDtFkQ1OJUXI+gfbx5aXupaIhJBqYSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=usdthZ2kkCH1mCaNEp4bfy7JYxO9QLV/tggy7pwerdsVKCGcB01SPXsHkgFZFzNgPSSKKffhEX3osZ+m1yyA1Gtcd/oudkFlM7pdwjJbYr6ZF/UNQqe/FkrhvzA5pwnDIQiBjy+ggfmhWtlrhLWH8CvR0jP9e1JAHcYBDyI4sH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nn9FXRzZ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nn9FXRzZ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso2112144f8f.0
        for <linux-man@vger.kernel.org>; Sun, 11 Oct 2026 12:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791747851; x=1792352651; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FW2dTyK/u0WS1d5c9xgMwEedgZafe3qGz73+MBWcHDM=;
        b=nn9FXRzZlrjvLB/sFBX077HETwhdiFj5dj3YHWbJXSN1TUvGRZNpQRZCy2csrgz10F
         L7xG0alAUF2oHH/wPF22v1TIB7Lng4Fkz2NnLxikgwHeWUTX9Uzgd9UsWe6Ds44HS/dI
         kHSiVBOfjho0z+D4aKONToNIk8BRsIt4HbSn4do+niOAc5vXar9SA2SpUl7SI4Zn9H5+
         Gy1FOM3GJSjVT6azQnz0oC27g0P/itdUNM/Ioy/prsZQ95F2kdyuEqgOE+cvvzWzZEK6
         8/uWy44wjd1oQlBFD+gauaC9PR8Qzpzlh1cHST6J8irWjbRHV7AprCe6Re9VjNe3WjRy
         AKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791747851; x=1792352651;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FW2dTyK/u0WS1d5c9xgMwEedgZafe3qGz73+MBWcHDM=;
        b=AHGc3HelnS7jwwZEl+I0RiqR8FIdC8Z8EpskKb8vMgyDv80Mbj9R24FyD1i/35EhrQ
         8hLp5SwsC+ljdzY7pQQImAKm8ieDcRL1JlkwisPGEFnmk03j4mrnmDcLAdfgLS2EoA9s
         m+d/gCuUleou1p8LsINVlK/o+qyim265FO9jLeu9y+bf3g3F4hdgCSgAH1tUQt4xD5f/
         CtBnW+x9815q7dpPQkddQt5yiCtUj0thvh3hgJe8QCsaUZucQMs4vj0mFGIPkbxm1J5n
         LRmgTnq34S5UWLXK9q/53eczKpaTc66wITpaXuwZYRObIX/H6sp1D9ORI8NYCbkxmTKH
         29PQ==
X-Forwarded-Encrypted: i=1; AKwUvBwE852yEW2zoqXyES7pWUActolATyZVT3xAdRxtwPzVaeUdepkhxJF2HkdQiWd67u25cegcwBb+l2A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnjsyCVBPD9NW+t76CCyGVmVp6S201mUz7EusC15WvGdfLWrX/
	yPADJ8wejeYJhA83uo1HgUbCgRLouGeRqcWR913OjDEVAtuhND9RNJhp
X-Gm-Gg: AYBFou1UjZc8hzAsYMA1MDJOTPrTjfBTw7hwPyDNG+DJkjEU2UcHwm7OjDTRBIGQ5Y5
	TbqdPbQXkLSskFWxm9mQwTYnFm9iXfLOWkdg7uoBiH0m9hzXK04Zt64nbNmMeaaje3u4hct2X2w
	84RQLSs1UDgY0QJK1S9m+i6LnzIUKwRAKUlXMf/MZ4wj7cWwTifTERBSSzVKUaDCFDPlE2YUl1Y
	3JMReCErUGKgydMbm0fz2Uf10hnooL0noxX8Iwdg6n5bnGUMspvuAzNUx+9ecou8iKwkwNJ5ox4
	Yvj0/gSKGvZpXjDRXHCsucK0ZyAJyXVAZDXvPcoYcm00MwDfarA80DJgevkEefrzabaoCjxy4jk
	LKpbwU0MKpdOKgS+VwaPSzhc1TelKXbT92Veo8j1UNpXVdLQckVNP9ZQoO7DMK4hm5A53ZzvmOd
	CdebKWKXSVuJPr4W9Q56AMoHmteXFJV7InXeeK5XHhkH91F+ikjMDhJIsQXmgtOZMAgTIvduxOg
	z+2d5jcgIuHY0xR9XkRGkA=
X-Received: by 2002:a05:600c:8509:b0:4a1:6616:31b2 with SMTP id 5b1f17b1804b1-4a18dcbf0b9mr166178775e9.8.1791747850565;
        Sun, 11 Oct 2026 12:44:10 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e2f08sm15662719f8f.15.2026.10.11.12.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:44:10 -0700 (PDT)
Date: Sun, 11 Oct 2026 21:44:08 +0200
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man7/landlock.7: Document whiteout object
 peculiarities
Message-ID: <20261011.6395f139dd17@gnoack.org>
References: <20260828160340.11238-2-gnoack3000@gmail.com>
 <apHkx3LvRyqYIB2F@devuan>
 <20260926.919c130a1a6b@gnoack.org>
 <asvCjvg6nGJafgdv@debian>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <asvCjvg6nGJafgdv@debian>

Hello Alejandro!

On Sun, Oct 11, 2026 at 07:09:31PM +0200, Alejandro Colomar wrote:
> > On Fri, Aug 28, 2026 at 09:44:18PM +0200, Alejandro Colomar wrote:
> > > > Date: 2026-08-28 18:03:41+0200
> > > > From: Günther Noack <gnoack3000@gmail.com>
> > > >
> > > > Bring documentation for LANDLOCK_ACCESS_FS_MAKE_REG in line with the
> > > > Landlock whiteout patch [1].
> > > > 
> > > > Link: [1] <https://lore.kernel.org/all/20260813093157.1436894-3-gnoack@google.com/>
> > > > Link: [2] <https://github.com/landlock-lsm/linux/issues/66>
> > > > ---
> > > >  man/man7/landlock.7 | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/man/man7/landlock.7 b/man/man7/landlock.7
> > > > index 880dd50582f3..3642a64ff1f6 100644
> > > > --- a/man/man7/landlock.7
> > > > +++ b/man/man7/landlock.7
> > > > @@ -204,6 +204,9 @@ Create (or rename) a directory.
> > > >  .TP
> > > >  .B LANDLOCK_ACCESS_FS_MAKE_REG
> > > >  Create (or rename or link) a regular file.
> > > > +.IP
> > > > +This also guards the creation of whiteout objects
> > > > +as used in OverlayFS.
> > > 
> > > Reviewed-by: Alejandro Colomar <alx@kernel.org>
> > > 
> > > 
> > > I guess this should not be applied yet, right?  If it's ready, please
> > > let me know.
> > 
> > The whiteout patch has been backported as bugfix to Linux 7.2, 6.18,
> > 6.12, 6.6 and 6.1.  Since it is in stable, I think this can be
> > considered ready for the purpose of putting it into man pages?
> > (Otherwise, we can also wait for the 7.3 release.)
> 
> Yes, it's good for the man pages.  Does it need any update regarding
> version numbers or HISTORY, or should I pick the patch as is?

I think it is fine to pick it as it is.

It was a bugfix and it is available on all Landlock ABI versions
exposed by stable kernels.  So the described behaviour applies on all
supported kernels and Landlock ABI versions.

Because it is a behavioural change, callers can probe for the presence
of the fix with Landlock's "errata" mechanism, as documented in
landlock_create_ruleset(2).  The list of the existing errata is best
checked in the most up-to-date source in the kernel documentation,
which we are also linking from landlock_create_ruleset(2), so that
users are encouraged to look for the most up to date list there.

–Günther
