Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814565;
	b=L4ZfiyUgF+RbcU910Maz3EtQPszVnQCmpNEwi/VLsmPntszU/JwogupR2OJ+dqv4PZFZ
	 jAFt9bJCLeikX3p/8jCM5w0t6h1gmskw0dQ3wXf4wsJjlLG8/G+EPD14uQoqKwAoVdMX+
	 hdmc8Eymd4E4WIdA6ZoyL4ZvnjfpmlusBHWzJ7M0n6eDp1GIJVJRcVt6zM9sUjEDiQqSB
	 XUH1DpLLxHHacp5TFQqxp9yNMH8O2B728KsXu9UAtTc071jwiII+014OJ90mYIh/hsJi/
	 mpeVGNThbh9U0K7P5siTaweUCvuc+562IPD2DDYpuCVgJKzAFXaKzTqnylMao/QDMwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=iLdo01+j2O/tI0sCNugEy54aH5UL1uEhg/4btCykT9k=;
	b=uSTBNZtbYfsX3CdjzwXIfLP9yJWNIliHA/NXbzN9zhGtB2NYCXg1wIA0k9qiauXth7jH
	 Wr7caFi3F3GtnhLqthd5UybJMoQm2S1iFt/u+M+01L+GxtadpQZH/YO3gCwrHQlVxFFs4
	 MspIbUZv62aqygVDyg7UCrwdvbHQBXBpOttm/0RygS2oyxL5vhJFWQcpiR+vEAmhPZY8l
	 CXr1MthMOgB4u9NpGgMDlCCZG0j6kOHtIaruCrHI0bV597bVBOXiwcyJa7KMqFGrFf8b/
	 NQ62bU1ivrIaujC2VmKhYmTV8XAb47bhCE8u8WlzlE6KgjNTb38My3h6ikEFci593Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFCS+7tS;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CEA606A31C
	for <linux-man@vger.kernel.org>; Mon, 16 Nov 2026 07:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44CEA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFCS+7tS
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so34546415e9.2
        for <linux-man@vger.kernel.org>; Sun, 15 Nov 2026 23:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794814564; x=1795419364; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iLdo01+j2O/tI0sCNugEy54aH5UL1uEhg/4btCykT9k=;
        b=CFCS+7tSQSGc5o0fkSt9Q1aQzattSp1HNUsM/8fZfeZbj8Ok84XvojmJA3yNNpLKUE
         X0V8cWZhQuHlfKJRtcxHPOCnzdJQwyiVt7KNJ9YfdOH96q2pFHWGYEsntc8eaMVizbiC
         xzrXQEv99XG9GHV9cPHUI+KTz4KZuASF9iU3Cae4VZ4WGc6YmFaaw7RKHrDWx02DELdU
         aR68QdM/qalEDxnpcIAz06bXqel5Hxj/ZxS7KlqJ2HM8n9UU6BHNEEO48r/W+O/nnumf
         VkJ13dujaWvXljt+Twt0rdUXf1kVhsadAVdlmdCuiKk+6izVAtsh6gglHP8n/dg24kCc
         d3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814564; x=1795419364;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iLdo01+j2O/tI0sCNugEy54aH5UL1uEhg/4btCykT9k=;
        b=2YFBK9rh0Z/yk03Y4xLTTGwJ60I/EPpYgMkEY8CBC9ukT28YLHN/gWM/TYnPlqSQYH
         3zdzxNpE71Xp5UmeD1pJSdWcbkc29LSX2ZeGKGU1BLwbX4LIHYwl75+sBoprsKBNUqYC
         WEd5Xy7NYKm7WqxZ3nd5n1Mcl7u2rg0ELctB7vejEXxYrWAUrogk7aVcSxPMz5lYiEQJ
         nRjHLdRkaUlzCXd8e9TEAKeoqGJtOCV1fLCzV7hsgMlenyU1ETDgsmUxnc3qtaM9gKZZ
         lrk4mxIqXra6neFuIzdwSQTWEQlkhZJURNavUDFrXKBtzkVk14sjSnfglg3exZYxsrL1
         o8Cg==
X-Forwarded-Encrypted: i=1; AL+hErF5pQWGKPSyBDkjN1fOj0pada5175zIPHgUdR7XEIyVSFTz74g6FBu4hoBXKg2IxrvBQJLIclMCEgI=@vger.kernel.org
X-Gm-Message-State: APuU4Z87D4KdditQmpWB4JtplXwl52sJK5PfbCZrkm7vu32uzWDfFl5o
	icaEhHKx8mFIGpx/K3RtNxc+yCBF0EswRyaWjGBsweh6V2EdZotP0fwt
X-Gm-Gg: AYBFou2rL+42P59rXa599xmpYPt/gqbgab7YtBKI84pEiNzZsTFSHhO426UHVTuIEOr
	vLSrtbJ3Kavoi8MevzO7pUKGXMy+X5sOzt11WkWUIPM1aPemDdbkse0NafOx4Mow70Ek81XJhza
	mIXiCWng9irybf3xv3ENMdkgTbG+csntvP8JtIrc1UshDw+quOsyJNNsjwAueiTcunONux9/aUo
	2cuCPk+uugDP03Wfag2rBG9yHfv/i3XcCQxfybZCAlMhGkwpfpvfUZkH+iPY8H48avyBq5fvLNc
	T3hJdr6Zc5z8DZRL1yxlh7CEINc4EPZe5pAqXxvktuwW9r2fvTfXQhv9bGoNaxjgzsmcFLFL2J4
	TQf83OBxeAkE2rKC7DSV2QmHaPdTDvlJSAcRTcHQxULyXK5htGVI2j6Tbz5Jp+zTXaCH8Zh+fOe
	xh8sk84SuMdL+lnGqJ+g8utRdJH0EWcbt4m5xgvEhlVXhq6orbWNFHWIk29IrfNo4xFyOFsdNhr
	49+BVfqlv/SBqNBaZM3Kyyv81aP0bfdjQqV2QR4Xg22+75BmYZHpCKlKBsMHcRVh5ib5PmoAqDx
	ldg0/3VPjO0Xripj1Uj3Iy7ePE0UL/s/A/T97B3La+WFnoUKZ/HIc5o=
X-Received: by 2002:a05:600c:468d:b0:4bb:741d:ea0 with SMTP id 5b1f17b1804b1-4bb741d103amr21119935e9.17.1794814563429;
        Sun, 15 Nov 2026 23:36:03 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5faf05f8sm155275055e9.10.2026.11.15.23.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:36:03 -0800 (PST)
Date: Mon, 16 Nov 2026 08:35:57 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Alejandro Colomar <alx+linux-man@kernel.org>, linux-man@vger.kernel.org,
	Michael Kerrisk <mtk.manpages@gmail.com>,
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>
Subject: Re: [PATCH v2 4/8] man/man7/unix.7: SCM_SECURITY: Generalize to
 other LSMs, not just SELinux
Message-ID: <20261116.34a1603ed035@gnoack.org>
References: <20261103202211.13820-1-gnoack3000@gmail.com>
 <20261103202211.13820-5-gnoack3000@gmail.com>
 <avpUW_zBBph5d40d@google.com>
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
In-Reply-To: <avpUW_zBBph5d40d@google.com>

Thank you for the review!

On Mon, Nov 16, 2026 at 12:55:26AM +0000, Kuniyuki Iwashima wrote:
> On Tue, 03 Nov 2026 21:22:06 +0100, Günther Noack wrote:
> > [...]
> >
> > diff --git a/man/man7/unix.7 b/man/man7/unix.7
> > index 61f06a74359b..c0e2bdbacdd8 100644
> > --- a/man/man7/unix.7
> > +++ b/man/man7/unix.7
> > @@ -538,13 +538,16 @@ .SS Ancillary messages
> >  option must be enabled on the socket.
> >  .TP
> >  .B SCM_SECURITY
> > -Receive the SELinux security context (the security label)
> > -of the peer socket.
> > -The received ancillary data is a null-terminated string containing
> > -the security context.
> > -The receiver should allocate at least
> > -.B NAME_MAX
> > -bytes in the data portion of the ancillary message for this data.
> > +Receive the security context (the security label)
> > +of the peer socket,
> > +as provided by the active Linux Security Module (LSM).
> > +The received ancillary data is a byte buffer.
> > +.IP
> > +The exact format of the security context buffer
> > +is defined by the active major LSM.
> > +For example,
> > +SELinux returns a SELinux label as a string
> > +(including a terminating null byte).
> 
> nit: s/null/NUL/
> 
> otherwise looks good
> 
> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

The "null byte" is spelled in line with the man-pages(7) conventions
for consistency, where it says:

  The preferred term for the byte is "null byte".  Avoid writing
  "NUL", since it is too easily confused with "NULL".

So unless you feel strongly about it, I would prefer to keep it as is.

–Günther
