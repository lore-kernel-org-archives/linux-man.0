Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792820394;
	b=5pXipe/xGof0ZuRNIf4L/pv0QhwRaQjp6mY/kQ3WBdv5Y41ldYtplrmEqbm8aOGBlV68
	 1JK/FwQv2t4jS7OoK4dtf/hkVF+8deYy+x4wjrmqRyOO2g3I36pHluoEm9Hsap1B/YYnL
	 jJ8B7smnypDTolnzzi46oTAja4U4rGgcBSfaM3jfGLPXeYyZ/KUPuz9K7uIsF2WuBCBUk
	 ZZtUL8zMMkFNCxsONLJcR/viqZMfvaGSZbsBsKwz3fQ7T+9eXI44pzCPnGMhW3EgNAMTq
	 iJ7poNdM8iRxI6yzm/Vyq2CJXxaWLSf8YX5q71h9YjYKh0SYhZxcJjOm2R/EiBM5vhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792820394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=VDgOpTfgK6ziSM5YtOWVItG05qIC5KX06RYcQMuOAHg=;
	b=JWRaHXYf9PJws6yXlwpGOBL/c/1RVdleg3IECdHZFEUp2x24wGbyb1k+aFFe6EAWBANN
	 oztYXn1bzJrmHGr9fFWDjwMw2Uxs3QoqpXbI9Tuhtde8jkvlDdr8j9af0ZttEBBI30lDS
	 CH70zT7hOeb97mhaAT3zWQgp+uLirYoFPZzCb+kpfWf5BJHaBWr4Z4JzJuEGuFABQgsAs
	 bQH4ZUJ4jYMTq9lLUQCSpYdnSHmo3S+Es4Q+TYGqKI7IJytFXRAkB9GXLGvs+hQTjUaT2
	 4DUix6J9hmOArUGbx/NepKIbvJ2vjkXGPbfhPmscA0rqdJ5RzgprbRf2e9IEZG5PgCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=PPmZ3BbN;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B264C606A31A
	for <linux-man@vger.kernel.org>; Sat, 24 Oct 2026 05:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B264C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=PPmZ3BbN
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ea785a4decso15981745ad.1
        for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 22:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792820393; x=1793425193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VDgOpTfgK6ziSM5YtOWVItG05qIC5KX06RYcQMuOAHg=;
        b=PPmZ3BbNJ7zLrskS8WsiWJjDn/XXqGkMsdBu4T5kiwG6uOCvS2KdTbBWFEXK3WA1Ve
         OGlBBhZPVe6ITYzqyUw4G5pz/5hFKisQmOWNfaBpPJ5ThxpyhE+UWy6tOzf44Q0Umnyu
         4nY1Ib2dFb3WezXI3Tmu1IU6t//ee6uaMTVfaJYNp1zr5JMk3h6d/ZlDDnFd529m/1e/
         E4djKDp90ecr/typT/S26H2tWFqNxB7ea+Bh+jy7hOkw5d1q9xJ2vbMOl2JU117A66bv
         4nd5sQL5F41PpjDRztxGt4ESjnzq7nuVWbqIJ0udNEshaehOdXIXjEoNW1OPdkQgwe83
         zUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792820393; x=1793425193;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VDgOpTfgK6ziSM5YtOWVItG05qIC5KX06RYcQMuOAHg=;
        b=IKedMz1MDcOOwqUR2SOyff407i4eqOS7bYYG79sRrnX0JtemewmP1M680HT8quuOxC
         G0iR2Fi8RUHtLhYxrVI+cUnxlmrNf1ZYwCFysoVQbO8f/GzBk+tyya7BVhAQSuF5Hx1u
         ddzG96wTh7qHcyK0j+yuWnMDEaYgC4l6en0uHpUy9Md3GXHYmimhQ7ox7y+T9ONLZqCM
         keKtBnW+jdMEy/XLCK6fnOrg0cqdVi/rHJpJmQY12a6FTqpTVF9JX1gbsrJeS5DRQH4V
         YADW+YVQtZOQpxBA8iMdiw+4vNlUGswoc83wZo7TrofHJY5E1P1u0uXieEAa3XQUyOwl
         YA2A==
X-Forwarded-Encrypted: i=1; AKwUvBwarf9lPp50/8KvfkZT+MsVoE7oUfLSEZbdHJpe3JkA0rlxxbprL5OVtWF5w7d3xbT6b5avL7JQ2n4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrokYVYoFLuUHYjuhNen2HsIHgpStGydKvKD9LvSwziK0zyLaG
	/kRaImM8UEw6xEA8EXv9pmLdTIQOFFM6ZLMi1SsDlSYUe4n0kyGW659BKfoE7k/C4BD9HZAe9a3
	tj9baRA==
X-Received: from plpn9.prod.google.com ([2002:a17:902:9689:b0:2e4:9044:4638])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:985:b0:2ea:1e40:624
 with SMTP id d9443c01a7336-2ea9cc1ce37mr7605895ad.17.1792820392853; Fri, 23
 Oct 2026 22:39:52 -0700 (PDT)
Date: Sat, 24 Oct 2026 05:39:52 +0000
In-Reply-To: <20261021210800.27338-6-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021210800.27338-2-gnoack3000@gmail.com> <20261021210800.27338-6-gnoack3000@gmail.com>
Message-ID: <atxDa5S8RPeZTm7C@google.com>
Subject: Re: [PATCH 4/8] man/man7/unix.7: Explain Abstract UDS scoping to the
 network namespace
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Oct 2026 23:07:56 +0200, G=C3=BCnther Noack wrote:
> Point out that Abstract Unix Domain Sockets are visible within the
> current network namespace, unlike Named Unix Domain Sockets, where the

s/Named/pathname/.

pathname, unnamed, abstract are used in Address format section.


> remote socket is looked up through the mount namespace.
>=20
> To avoid confusion, remove the word "namespace" from the subsequent
> paragraph, where it is used in a more colloquial form (there is no
> abstract socket namespace in the sense of namespaces(7)).

The change still uses "abstract socket namespace".


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
> ---
>=20
> Notes:
>     Verified in code
>=20
>  man/man7/unix.7 | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/man/man7/unix.7 b/man/man7/unix.7
> index 4c46b54206a5..232fdbf4c3cd 100644
> --- a/man/man7/unix.7
> +++ b/man/man7/unix.7
> @@ -257,7 +257,17 @@ has no effect on the accessibility of the socket.
>  Abstract sockets automatically disappear when all open references
>  to the socket are closed.
>  .P
> -The abstract socket namespace is a nonportable Linux extension.
> +Each network namespace has its own abstract socket namespace (see
> +.BR network_namespaces (7)):

Remove this sentence and...


> +a socket can connect or send to an abstract address
> +only if the socket bound to that address
> +is in the same network namespace.

add "(see network_namespaces (7))" here.


> +In contrast,
> +pathname sockets are not confined to a network namespace;
> +they can be reached from any network namespace
> +in which the socket file is accessible.
> +.P
> +Abstract sockets are a nonportable Linux extension.
>  .\"
>  .SS Socket options
>  For historical reasons, these socket options are specified with a
> --=20
> 2.56.0
>=20
