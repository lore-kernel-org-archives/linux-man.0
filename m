Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047710;
	b=DNfoKzm+axbr3/KTMlG3m5OYq7jwIISNF6g1STVu3Ga6i/wMCK+b2VTlSFixEGKWQexM
	 NTVLZMWcUYH+eEc3V9odLlpirQYr6PimZrjODrX+TkzETz7V4Bk2kyame/QqkHbmw2DfL
	 fz2eQ4Ds8A3/YT/q96A0vH0KPtzOF1mqq+pqat+wVrZ9pMRqFpz/aUbsI3etU05RuuYmC
	 AWT8ZvQmktHd4bzIXu3qJsYjCH4FCA4+RaNjyabYcEz7xMah6/HP/Dle6DzcqMfhJCgbW
	 eAPDUArMnUMBiRQy1gIwTjgInxQdIg97Qkri0wO9c+DDzxGU8p7sHHp4n9NmXdKk7EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=Z4glvP1nfU3ScLlEBi63bo7M3n0BLx7MkriDGlt70tM=;
	b=VbJUavhYlCBq70B9DQmCmuaQwbfrbLB/FE6cIJ7boP0xJRHJrKjbr+mqFjEyvICrY9cU
	 sEhaEvPH9iSfaD0wxprawJF18xaZtLhVmnIhlWjroVFEQpEbUuMiDtbebDL01/guiBkDp
	 CNiLkXx+lANNtEO3WwsNvnFocmzsPR1n6zAYQtKT+hg7Z+EZH33qqj90aab7BARvuADq5
	 KMsOvXJSY125Q/hChn4GhRpdM2Z4AtmIH88BXghcLTcE9XBFqW6ElcXH+RzQZuOsDeBD3
	 cLN6RYRYTNvDs/6BcpJCiWtGIl0iu5MvAGEjlkchkUjvfoCSlUs7NRtABZKhPhaQQCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nxoTAGj+;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1692D606A31D
	for <linux-man@vger.kernel.org>; Mon, 26 Oct 2026 20:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1692D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nxoTAGj+
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso4750915e9.3
        for <linux-man@vger.kernel.org>; Mon, 26 Oct 2026 13:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047708; x=1793652508; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z4glvP1nfU3ScLlEBi63bo7M3n0BLx7MkriDGlt70tM=;
        b=nxoTAGj+20mFx5bNGi3DxdpculrurNubNS1AGj54Q9Z0VsC2bebP34ChH8kCGkm+M/
         ftx8XK+dKRpUQocGt8xGHNmrLiC9T6Kw7EqJ0IyRxZGdHC0O3RPZl407ZeR0FKlDJ9GG
         UktBSoJvLA4+Va5tDmYp4ttER9GNKVPuQGM7ybwtZ36tEeCE9OZfg/bdNQAlDUjjaqwe
         YeMY+KOPJkdPWlcGMqioNSQ5owOQdnbo7zTXYuxU3v+F04WDap3NVZCoyAK07nTlQucG
         lYUtVv6WJffwJpIKyQwxPai1s4p5xZsP03g6ApfqaizX4ObJJjTe/jH9gNuBi4biVc1W
         KlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047708; x=1793652508;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z4glvP1nfU3ScLlEBi63bo7M3n0BLx7MkriDGlt70tM=;
        b=23E+OyiZD5xZh3IgpTjIWNbsJAwH44X3EItHQXaEkZFSsi3xu3YhbwFLsm6kZidmzX
         bdoovL3X7v44Q6Tt0/v3hhhFAf5hDvU0ow8+NaUP6Bx3aXpOCbpE0991nRxRE9wWjlBr
         2aQV4H9bDxW0SvzGOg91NWv8JGi314t0jhjv9P8GxO2LdPaTDq+bKX/I3zYe5erdj7Jy
         5X0iScfQJSaM5ESvxKU4SgSZWCw3+xryed4d3e4zAKvOcpjE5AFTmIOUhfGd/+XYGE5F
         A3bEUnrD2kAwyCfL2QIc+YP0AqVIWJLaV90UW2RZ7ERKHwJR6/o5PLAPR+/s8XC7WSzk
         Ougg==
X-Gm-Message-State: AFq9FYL+/0i4/EQf7b3BUQkefXTqzhj83TPqVFmwLSgu1g0q0dVhGpfB
	Y6TH5j8A44xrqkWGBfKuMJdshxsI6ruHLRaJh6y3pBQ9KYlxTaS/DlI0
X-Gm-Gg: AYBFou2r/HE5QoIi9H3rt0gc7URpN/1wYplRCPpu5HLibhGUUOKEsh7yC3r7TkVpl1S
	TLXhSQD//o9IG/jzvwyQyYS9gud0M1ZArvHRh4dNl8ulgMVwCIVlpicHlOK4FO809nt4+hqBOLi
	xmGCKFxqtgXJovs7t1wlue46DZ2mpKd34iWLToRZl4q9Aw/uUBoNyiby3B9aJCe7/MTFY9TB1Dt
	tRSAMcuYBpA2vtb+/AVd2PNplwQPKpbeOGEyKjQ7f5wCP/rlzMZOWB7Jm8g0PEF/xvku/WUVBsy
	OlC9fP6h5yG1+gYObzqdwGE6qYx1PqVvsIxdx5EfAL8BmC2Qa2VPNgNVO5RHB02UEBNnGYaaR6E
	93RnaDYli0tOrnhmidQfVg8vWCizkWQd+5Y7Nqwpr7ME3hy8xODeAqAzeoo7CUPJMpZSN7Bb9FC
	++IGosCVblh3bHnSOzKR6I/8STsv4f2wSgKGW6MbWw833piJGP5mWQq8vOnv5GFBqhyTLv5bSfz
	/Df/VuuszDaRxs2Xw/gPgQDdYYSkJ+xQZC6b5YClEtge9TNiHXheKrvP2CyRqDMbxf3fLMKSSZZ
	VtHEIkeaSyvqCZv23WjiEnLt3XakPc4khkTLUt/EyBO99fkpSdnS95o=
X-Received: by 2002:a05:600c:8488:b0:4a1:e0d5:293e with SMTP id 5b1f17b1804b1-4a35aca1366mr139323515e9.21.1793047708181;
        Mon, 26 Oct 2026 13:48:28 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3932sm19731771f8f.18.2026.10.26.13.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:48:27 -0700 (PDT)
Date: Mon, 26 Oct 2026 21:48:23 +0100
From: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, Jon Maloy <jmaloy@redhat.com>, 
	samanthakumar <samanthakumar@google.com>, Kuniyuki Iwashima <kuniyu@google.com>
Subject: Re: [PATCH 1/8] man/man7/socket.7: SO_PEEK_OFF: This option is no
 longer specific to unix(7)
Message-ID: <20261026.2097834a18c1@gnoack.org>
References: <20261021210800.27338-2-gnoack3000@gmail.com>
 <20261021210800.27338-3-gnoack3000@gmail.com>
 <atulJkR7fAgyKhPP@debian>
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
In-Reply-To: <atulJkR7fAgyKhPP@debian>

Thank you for the review!

On Fri, Oct 23, 2026 at 08:20:06PM +0200, Alejandro Colomar wrote:
> > Notes:
> >     Double checked in code -- this feature has been added to these other
> >     protocols since that man page section was written; I made sure that we
> >     have all relevant commits listed as comments in the man page source.
> 
> Actually, I prefer them in the commit message.  These days of git(1),
> the comments in the source code are less useful and more noise.

Fair, I'll drop the newly introduced commit hashes from the source and
list them all in the commit message in a slightly more comprehensive
form (including the Unix commits).

–Günther



