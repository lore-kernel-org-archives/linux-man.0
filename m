Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BB348D868
	for <linux-man@vger.kernel.org>; Thu, 17 Sep 2026 23:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686569; cv=none; b=Uvvc3sur6iK1SpizjP9HbIPio6E2kvlGCUjyfNZ+iiDVOkuhAQk52dFPa7cq7JwP9wbkePpEYNseeT2+x6MMqdo6+/Fyx6N2lfoosrdTYgYVRnh3gijOgYymnzxMbjkqW3oP6b10tJav6Tk4ptYyPwqgfWDusjXK6NeNKOPjgew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686569; c=relaxed/simple;
	bh=DExMz4eACDBZnztI61u+pe65QAw4YESQt7YOPPm7PeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+IABq2WSPX6Xg7HWEFvaGF16l+S3GxzWmndtoNgEpTEzFsTyyTmsrBjhrwECUGnGJHp1VFbnj9PNhjROfC/SCxF3EksI4GIuhSKDbOTpp9fs8vYaXJpJ6qA8WCXt4E1wfVsB6zpdT3jIMX91mE31KwumT9aG1qDXVjFCq0RYnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DigqI8RN; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DigqI8RN"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-671563fb8beso182607d50.3
        for <linux-man@vger.kernel.org>; Thu, 17 Sep 2026 16:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789686560; x=1790291360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lmFDASDmebAR2aBjJSMF4do9onDjqkE5Mt+MQK5ERE0=;
        b=DigqI8RNQxuQGYp6ONCzCcJ4HISm+LuaxqnoK5QUpl3Hx9+dcYoxUA57G6xlGuRoLZ
         1PHzf40kUuUwqQERFxmDsYfCze+DU0hdFte+fW6W7+4/b9gpZOwwKaFXoRmYTE6XD7VW
         grPgZxKGQAvz+sHSbJORm/atlEHqriRlwrxxjAXdZgFxxGFJ2kOIR2x2G6ZTaCwV8BQp
         kBg8gpOj9Ed3u/y5ltmuLlx5p9ZDkXxZ7RFmRDhRGU9HMNbdoTi2fc46s8k7ROZFhBxl
         FIlXdcGeUqDgBntMWqxq1o9iG++gIMwQvnEFYH6XmBKIiPDDJ7jhPGMMiJFipQh3XpVw
         g9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789686560; x=1790291360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lmFDASDmebAR2aBjJSMF4do9onDjqkE5Mt+MQK5ERE0=;
        b=hH9VnYvS4FOlUFe3K+bsOg1uTSL1JUDoOC55f+LkjvtX8MuDUQ54PMVuicgdkvJGZj
         aO5c3u6x16tU5kOBo+pETTAQ1COwd98HtfqMkOKF0IvkacviWneL2vJwu326SgCoT/pZ
         aKzHkQO+ihqiEGEEXIIIciJnU7ZkacUg0B5TiRNqFizE1SC4NtWodnoT+G1qxMZw38tA
         7v7zTCFg9P20hCCwbiByHc/sUKwoQGqksL5fcgPeB8RtW6IpG8m8Y0MePNXhB6D9KNqB
         QQ2PZDJgz6wCcBIFJ3nhDlNXblemKjwQF3P2hkR9QBtsqsvIG5ICr17gcMB6D/jTSpoB
         fdFQ==
X-Forwarded-Encrypted: i=1; AKwUvByHEt0n9XkX3h15MjMeiwXgQu8Pa+39hz72mVEOkojhgG3+Gd4uOwCe6i2oRLsIXYwrh/fgSxDvUyA=@vger.kernel.org
X-Gm-Message-State: AFuF++lllfBB47TDvS4u+LO9rnrImLAw4PXymxc645+hCPqQOIA/fvcs
	TvESiPuWMAeT/UbISGS+QISBV3VCq0wcnoB15rz2n3AgPrnQJT7rVIRw
X-Gm-Gg: AYBFou1flemGqjKFRh3GJx8GroXNIYLhJNbO6trjecuLLejhCrEyB3j8VbKEbKgF1Uc
	8uBRtUslKFcy90C81iNOyZfzoUPmJOEe39Yx8q1t/feemjzgONRmNoMIAMafOJVb30qU9klpzyO
	5YKzEursKkwdKZYWDe+L8YngZr+odRjsI2DaQTRLC24Z4sipk5qy4JTfM0bgWXPjcy9JOBpyM7d
	cnRA/Ho72Y72mFWXLSamcREqqxmO00GlL/9s9t0O8CFfHjzqN7LMup4VMzhulJlV8avZe6E76nB
	QFUIRk9DTlFtKScHBixItswXm9btxTdLac1cvJZMfKh4Z7MQJjOuxvdiZ7lWpmHldPuGPivScd4
	vkdDfJOI/sVTcsiF9okQ6Vo3Mh1GBQA/G3HjGxfR02W2od7xRZMusRdcJ2h2MpcYaonMhFWahey
	a6weLRs4nbgwwJ7vXTBOkEnI/VxXEhBVQBiLPmYN6k1kqNI8FhegocNFAy7TDmFrQpqsW/D7/uw
	mx/fU0gZQ==
X-Received: by 2002:a05:690e:440c:b0:66d:f0d:f1ba with SMTP id 956f58d0204a3-6717fd9024cmr187332d50.46.1789686560261;
        Thu, 17 Sep 2026 16:09:20 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980:4f4c:9d3d:ae83:2fcc])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6715f6e7f55sm3144892d50.9.2026.09.17.16.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 16:09:19 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:09:17 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: astian <astian@memeware.net>
Cc: Alejandro Colomar <alx@kernel.org>,
	linux-man <linux-man@vger.kernel.org>
Subject: Re: [PATCH] man/man5/proc_ioports.5: wfix
Message-ID: <20260917230917.v4m2hm7mma4k6gdq@illithid>
References: <aqvVeSW_dHnYbwca@devuan>
 <20260917195829.1380868-1-astian@memeware.net>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wagpoyjcddyrqu3e"
Content-Disposition: inline
In-Reply-To: <20260917195829.1380868-1-astian@memeware.net>


--wagpoyjcddyrqu3e
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] man/man5/proc_ioports.5: wfix
MIME-Version: 1.0

At 2026-09-17T19:58:16+0000, astian wrote:
> Signed-off-by: astian <astian@memeware.net>
> ---
>  man/man5/proc_ioports.5 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man/man5/proc_ioports.5 b/man/man5/proc_ioports.5
> index 10d03f5aae7a..54854755c0a3 100644
> --- a/man/man5/proc_ioports.5
> +++ b/man/man5/proc_ioports.5
> @@ -10,7 +10,7 @@ .SH NAME
>  .SH DESCRIPTION
>  .TP
>  .I /proc/ioports
> -This is a list of currently registered Input-Output port regions that
> +This is a list of currently registered Input/Output port regions that
>  are in use.
>  .SH SEE ALSO
>  .BR proc (5)

There is no reason for "Input" and "Output" to be capitalized here, so
I'd fix that as well.  I don't know if Alex would insist that change be
a separate commit.

Regards,
Branden

--wagpoyjcddyrqu3e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmqscx0ACgkQ0Z6cfXEm
bc6nvhAArItdk4zYnqh4yVYNfxBDXWa5iSPNn/t9UWrffwfOuAiSURfMQfTW/NR0
ZeZHDfRRlb19498B9cOg6BJnC/4F56MSGIhApR/V4LyjDOvEbKCdcZLaf/uhTY/K
zqTLs1zuaH8mNIVf0EjeZrP34tbxGq8zXbWdws1An9rA57XnKqfF1mMkpC+0hb2w
uiGv8ROExxReesaO9D6O/Mg2SNaRltA4atfWu6rjdoMD74NHbL/UCAb/F4FLG1iy
0qoMBR+c6BB6qKLSIvkr4D2tDGkG5wEYbd6ytkaTtW02PuG3mQTcWbSJMr0KzMGW
LnfYtEi8o24Lp7FpsfnxyN3T3t6g9jgn6pTwx0ewMRk+zx7mAxCxo4o40b/hvpFC
rnct/83fUyjx8F+VrtaH+dRWSHEkXhNHH8M/noH0sRP/At8KY3wczF4liKosPZPg
ngBzU8YfKubCcE8EwLRJeN6oJGAi/HpWpFtH10hRzoKxikMsvYrMYYRoqj4Ou1S6
po90Pe5m157AUKg65wqkfJDBfJ5/qxKJEQ57zVX/vxBwsGTD1zjL1B8WGMu4A+m3
q0DMJR39cktcbShGXy+D/kSb2hgy4W+swlaoyY3DTfA6zYnHo59G4SIh+uEuzRld
hkePgtdV5GSJFKbI3bXjCj5Gt6F063U/WRuvwCIMNvtID7fVk8o=
=QxZ1
-----END PGP SIGNATURE-----

--wagpoyjcddyrqu3e--
