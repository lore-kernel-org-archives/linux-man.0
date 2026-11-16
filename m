Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794790164;
	b=KBz+KbcemeCkK28qfn76crKvVuQV5ikUXQlKWkYrkYCW+HgFBfQeI78cqD6Mh/1rMGvb
	 QTNJbJ3sUGvc+W7SrruWvq9pRK7tHIiT8wN7vflR/wvKgDGywfvn6ypfn4X+5iw5PXxyy
	 l70EU4nrZrUvmGjf3D5vH4WKUAtGYA82b/C0lED4CRmgKrJPMJlogE/4+J5frkIncClVo
	 qHALtiBF3oncuGScwnlAwbdR+UjEI0F9IQdw1sdWly/qYHoP2DncruVpgyMt9Zp7yQSDG
	 +AnMKmtJ9d5P0UCVvH1l2I1Ia7y8+HWtQm1SbjrRuNBo3vc7GGlZMkt4aJIJMw1PwXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794790164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=HzgnItC6HpCCBiydF5GnWh33lmEH/kpkOMrGAtx0F4Y=;
	b=uM/oSuo0uA/PYE5NFNYJuKT2Kx/WWMNEZ6G4crN9cdxC6wAChvI/rcyhZKFNNJug6OyE
	 OOa1juKXV1xu5ij5x7pVX9Jrjnurx3b+9Z6MQFsDHYpoQeu7Nx80F/tt4YYfKXEUTeWbm
	 kTa4ClkDL0l639GWMUCt/zGtImscV7Y2swce1YZoIUt7093x7Lbv9CLfZt8+0OgfsAY+u
	 WenhNw4AxpWW7wLFFt6NgPaRYWhlBmPxpQsC1ahl8/kKikisURAOlViFr1t6LqGu85u8x
	 m+qNRwdpCoaNSdWysNNrI0erp1KefbBRpi4yLLVS3hsXgdcntLd/naKgrYlHivZ8udw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=L5spRlV+;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B4D606A31F
	for <linux-man@vger.kernel.org>; Mon, 16 Nov 2026 00:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4B4D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=L5spRlV+
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b10afdf947so3672098a91.0
        for <linux-man@vger.kernel.org>; Sun, 15 Nov 2026 16:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794790163; x=1795394963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HzgnItC6HpCCBiydF5GnWh33lmEH/kpkOMrGAtx0F4Y=;
        b=L5spRlV+KrIQPNAP6R/3ST3k5ePDznRelvcguNVvTxHiHP7jA2cAH3A7Eu4Sh3u8er
         823lghktDY3yij8YzIC1lrPEBbOF8T1VqdyymH4ASEv2Z0MT972DOJNA5WCRIRvYtj8Y
         xTsVpZOgtXSSY8YyKZzEqvUA5GrmPZInfPZVCL2TfxESmZIsyIstxKxBsaTUqrSR8Ve6
         5Ne2ToC1oXHDwCgkboC4gJdV/gDBe1G6lIWxhDZHGA1LyGVANGtZRMQa7IljoMJyJd/b
         iWybHV+uLmPOM10mUPad+vfq1VGGRAonPGWALizbc5LqYsqvkNqw54/vVSRv60VbhK2w
         U9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794790163; x=1795394963;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzgnItC6HpCCBiydF5GnWh33lmEH/kpkOMrGAtx0F4Y=;
        b=VAkONLonLiyf+A1voA95uPKtCbhkfMSg6yu82rQXE1kRarh5ycJqllC7eX5LLbTVba
         1hUyWhLy0hYFKe5HAJZa8hPcJyFfRSW2V+NqeI4A4tg9avjQOehxBQrIDlk3BnwN3Dts
         wXoxJd2rGwN8MXQJ0Ny3z5iiaJbZx07P1DSuDFs0viANy3edcA1qO5q102PVveL4MD09
         rrhaJuBR9+OPLMmXKLOkS3VjKTfFYxGqbm6tU/ohTwAp4HaBeK5//b0adn0XYhrvGZAC
         8Qa5a4vBKRxUTOVxl4t6gAGr+mTJGOLahgDQywghW1cw/Slr0+C84wDsKjIfrn8xZ3uj
         zevw==
X-Forwarded-Encrypted: i=1; AL+hErG/dYQ6z5oe+sMMoWjUDdpctNw+0Eafb7x8pzsj9o7hLVgCv2SDkfVfrNFYvuYRP/InyhISF2OYORI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YXV4Xs5sujK5INWkkICeLDQQveQVbzL/AZUFUjw8wy2jYCQSo
	a0VRpCSc76vMBql+/HNXqXR88qss1ZZ2Tq+RcZMVX8mrnsziae2EwZXMMId5NGwAYw9gtHH490Z
	xikjLYw==
X-Received: from pjbmv18.prod.google.com ([2002:a17:90b:1992:b0:3b3:956c:43b])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a41:b0:3b0:9310:b255
 with SMTP id 98e67ed59e1d1-3b1b0d226afmr6051840a91.36.1794790163015; Sun, 15
 Nov 2026 16:49:23 -0800 (PST)
Date: Mon, 16 Nov 2026 00:49:22 +0000
In-Reply-To: <20261103202136.13574-5-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103202136.13574-1-gnoack3000@gmail.com> <20261103202136.13574-5-gnoack3000@gmail.com>
Message-ID: <avpTAfJZcNXshi-s@google.com>
Subject: Re: [PATCH v2 4/6] man/man7/unix.7: Explain Abstract UDS scoping to
 the network namespace
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx+linux-man@kernel.org>, linux-man@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 03 Nov 2026 21:21:34 +0100, G=C3=BCnther Noack wrote:
> Point out that Abstract Unix Domain Sockets are visible within the
> current network namespace, unlike pathname Unix Domain Sockets, where
> the remote socket is looked up through the mount namespace.
>=20
> To avoid confusion, remove the word "namespace" from the subsequent
> paragraph, where it is used in a more colloquial form (there is no
> abstract socket namespace in the sense of namespaces(7)).
>=20
> This is already described in network_namespaces(7) as well, but might
> be mentionworthy here too.
>=20
> The lookup of Abtract addresses happens in __unix_find_socket_byname()
> in linux.git net/unix/af_unix.c, where it is looked up in the network
> namespace (struct net *net) in a hash table in that namespace:
>=20
> 	sk_for_each(s, &net->unx.table.buckets[hash]) {
> 		// ...
> 	}
>=20
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Assisted-by: LLM
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
