Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6810345DF68
	for <linux-man@vger.kernel.org>; Sat, 26 Sep 2026 14:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790431853; cv=none; b=u82hW6PSKFaa1ClVD1cgocs41qnT7NttVpTgVgXpw9Q9GP1ot99w+7l9w0NDSn0Ta3LkaPEx5JHE7hlJA8AAz4WkZOT+UE6u08O4TfOilesafVQyaHS8g6y5spVgCv8WstmMnYvLtZLI4r5C3iBoKwSZU0AKkBtqYTb3Ru7PlUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790431853; c=relaxed/simple;
	bh=cvdO4USGW3RpEaVY3IXzlzHQLN2wzZi6i98UQ5aTkX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=adBjD3zgMyRXh05BbZKFiYAG+GxJDllgU+YZh1N8pS8ehkn5l771fnBIqGCVym8t/S7DFKepUOLQ180v8nprdGAoobohPwrz0f6lveuJfsqq6sAR3shk2/KbcMYGzNGKfsKSzjeT2MZ+e+ghZw7cELdlZ8wzx/rvw8kpb1mHaEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qy8gFSv5; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qy8gFSv5"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so1345189f8f.0
        for <linux-man@vger.kernel.org>; Sat, 26 Sep 2026 07:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790431846; x=1791036646; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OJpF3uab6VqfOfsvmd55TCmhzgQET5RNL/v+FYxCbmA=;
        b=Qy8gFSv5Atb9ubUCy45W0ib+Cc1XRHiGeN7VypT1R1sOw1NWr78JIlQFJvLXrn03oj
         uJcTRhkiMvJuh0hdYQoAUTPtTOodkwQDyNsTyO5ea5ABybmUS2kUvWCbi7E48D0tYGRM
         T0uX9CmTLMXrppfIehnjD6D0k9KY1Djc16lw91zmP57Qf7A8hnwYfKTdWqBs2Tp+3Rq5
         ECj6SkO8+POf6Yj5TQlGSUcxtQZtV/k6b3MK5DcknvyZr5eEY/gFYBZlJwwbW9uFZvoK
         cs6Yd9lkGzcFCb2W6lMgvjcevbcyRCog5z9jRs8NdBEIYzsd+lEeJfBV8go9X4xcsY6+
         jEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790431846; x=1791036646;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OJpF3uab6VqfOfsvmd55TCmhzgQET5RNL/v+FYxCbmA=;
        b=wzqpWfJwCS9ZWtHlAe5q3CeqMG+N8o4hfMk9xR6UwSWjLvMGdSPQPpFHKQm9lqyKzA
         bJYq/k77SBE+TVClNs33YsT/WhkXhFEZ/AzM7M7zrJbhHRAk+1jON7Wx9wvwq5UZ4gSS
         9sXFvHOb1KJY1QbTFVfqBNqSbaiFcOYHbNLGnmnzsk5XPL/2WvRfzOyqWWWo8K306tLZ
         oVvcW6gv7m1R06XCuPAo4LeNESh9JtcYjXiiaJGhIF5NvlzLyjiDDgUJxmzp1SUL7ZGP
         bd5VGGtEDDSZB5F65b1wj3M4iNkrgWQOQZkp4k3/P0enxvyNZQt4gJTDI9Id0F+YAviL
         S80g==
X-Forwarded-Encrypted: i=1; AKwUvBxk11zsOqc5ZxCESiM22C9ZZl0N2+IAn44Od8XLmTRXHuotpBNhVVUm95RlMEt53yxbDtpOjuSLE+M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxnOfui2kbhO6IZXBvDOvNwnmKtcccm74XIb0rSe0ftMPoIXHI
	wa73+i/bYYJyflDyfupeMLS8RZxtIah3/+NHnOLTOCSncz3RQa2jm5Up0CWCLl6e
X-Gm-Gg: AYBFou3Ioz315tMTVsgeOaO78yD6oMik/GGYbF6TzNBDpyoJIoGzVNYJGsVbi0uk+P+
	/p2w2+q9yfVuiCbSHhqmJaF0F4Xr5FgdcLVhCb8ohF4cmK4MYLnu3BuaE2BNkAR2oZge6bPVg/3
	Tb97im0tYy/YcXN1HK9x1EA8VSj1u0GsLQvSm6q2IYP69IeBe7SRdEvBu+rcFkvSqrNi+ttS3Er
	qjU4zHdm7kFwn8u+SYxTulVZWriJ0E26GCokmFLuuw+ccimYywHbUZDLeSeHsjUZovJmsm8Avq1
	g4gTymtfAZ/kLzooF3cl+erjIuIcliJazPl954FDMhCcM1FmN1ISX4FrMNUryvWTh6CpGNUxtmY
	DTs/FHVGztxjFoveUnsVNrT4V2w+aTf7/Jp/fkpXoxnLEuveYqDP8JdcQkp5RO3qa27F5EXlciV
	uc9j0ArfSkVMNPKf6WyrA8oXB4cT133EpjV8tALJ3SIz6GhVu2hHe2eS80yRHIm8Q1/nSBcX3xp
	WE10mbFAr/Lg/4I9RGUcIk=
X-Received: by 2002:a05:6000:2385:b0:488:811c:c78 with SMTP id ffacd0b85a97d-488811c0f2dmr8094206f8f.32.1790431846194;
        Sat, 26 Sep 2026 07:10:46 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349731sm14812337f8f.12.2026.09.26.07.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 07:10:45 -0700 (PDT)
Date: Sat, 26 Sep 2026 16:10:44 +0200
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man7/landlock.7: Document whiteout object
 peculiarities
Message-ID: <20260926.919c130a1a6b@gnoack.org>
References: <20260828160340.11238-2-gnoack3000@gmail.com>
 <apHkx3LvRyqYIB2F@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <apHkx3LvRyqYIB2F@devuan>

Hello Alejandro,

On Fri, Aug 28, 2026 at 09:44:18PM +0200, Alejandro Colomar wrote:
> > Date: 2026-08-28 18:03:41+0200
> > From: Günther Noack <gnoack3000@gmail.com>
> >
> > Bring documentation for LANDLOCK_ACCESS_FS_MAKE_REG in line with the
> > Landlock whiteout patch [1].
> > 
> > Link: [1] <https://lore.kernel.org/all/20260813093157.1436894-3-gnoack@google.com/>
> > Link: [2] <https://github.com/landlock-lsm/linux/issues/66>
> > ---
> >  man/man7/landlock.7 | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/man/man7/landlock.7 b/man/man7/landlock.7
> > index 880dd50582f3..3642a64ff1f6 100644
> > --- a/man/man7/landlock.7
> > +++ b/man/man7/landlock.7
> > @@ -204,6 +204,9 @@ Create (or rename) a directory.
> >  .TP
> >  .B LANDLOCK_ACCESS_FS_MAKE_REG
> >  Create (or rename or link) a regular file.
> > +.IP
> > +This also guards the creation of whiteout objects
> > +as used in OverlayFS.
> 
> Reviewed-by: Alejandro Colomar <alx@kernel.org>
> 
> 
> I guess this should not be applied yet, right?  If it's ready, please
> let me know.

The whiteout patch has been backported as bugfix to Linux 7.2, 6.18,
6.12, 6.6 and 6.1.  Since it is in stable, I think this can be
considered ready for the purpose of putting it into man pages?
(Otherwise, we can also wait for the 7.3 release.)

–Günther
