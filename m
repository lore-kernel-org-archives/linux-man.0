Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792781951;
	b=Xc4qC/aeG1NpgHMhWSTAxvb8/hG+Loe4PJgc/l8bErbUjtxym1l3QJqS8dpKZJXZtSfK
	 JPjKjE+Kq6TtHdwUae5PCe5E7xcyyTzTZl6lNsoEukt9cdMF9LuQmAG6jOi6b9egoXIlk
	 NCMjkuz5G2GRv7EvMGt3av+jvl6ZKUFZL7Zc2Br3wVi4va2+NDiDQUaEWg/o3eXaXfPZJ
	 8Bvt0op2M3IfzPrhqc+Kab/zhHCyHUcH4WOYKjfD57yuY/7mSUCoNdW4ArmU2F2aKRr8f
	 ae2g/jXMswEK06BLyUcpJPaV/4pf9fnyhdnUlov3qr8GeVkE4AR8VMfu7reahVBqP6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792781951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Content-Type:
	 Mime-Version:Subject:Message-Id:Date:Cc:To:X-Mailer;
	bh=7xfiR2xeAT/S1gYvJoPuNN0Bc5J9x6ervEir/dXa5k8=;
	b=bHuihIyNBOf6SLFWEsHlqmSjRFttiKt7rqRoMOY5FkBo5QfTcaO+ZpwTTlQOaORz5Rbz
	 7i7Hmylu95cPn2XhL0HUwDdPlBVP91ztxCJb3ba1nzmjRMaAkOV773ww2eMVWWannsx4K
	 z04W0O6x45TGANEDFWFoZdCrbg+JaUGeMY9GfFhDUicZhm8ZszAx+epL1oyAAQ4nUP77R
	 XlU9DfhxpIuSfqMB8QOpaFUQ9ISljsPnOq33qgECGg8Jhl3dNyUbGzk7q5jmJ5Zs17Z1K
	 97zinxOnNgIeCKyGpQMr8q59qSyjDrBdVSP+CgH5aa04Tpp7aJZ29D2Q+ijms3nKTTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KCYOPUdJ;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A5E606A31A
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 18:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96A5E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KCYOPUdJ
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so1482183a91.2
        for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 11:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792781950; x=1793386750; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version:content-type:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7xfiR2xeAT/S1gYvJoPuNN0Bc5J9x6ervEir/dXa5k8=;
        b=KCYOPUdJ7uNGKIdhmy71g8tzvfXxXwHqhO4oS+qta9Mh3yRqq8JpJ/eOdzTUj3Oyvj
         AAtD7GkAUdh/X/62LnKmlON5nk9KOFZ5OLI/Aow7PUnCsg0skQWUByYLPCaaV4zY6Ljv
         uFL5toUToN2AyKDPle3MpQWc2TK9K48Si+ihJC4kpWmbKALRguN0KnBXUKHrV3k5Rsdh
         K1swMgW2u3uqTV1KIa/iR79vvpMwDLHgRfjEBOPqFdGtD1gQgL4C1DCbIwoYggHV3Jqf
         beL4IRaOAwOe9/I8j2nYrfAYUFLu5adsvKXelo+xJCteGsp4yL2DIT71JyV9M3GdBjHz
         9qYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792781950; x=1793386750;
        h=to:cc:date:message-id:subject:mime-version:content-type:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7xfiR2xeAT/S1gYvJoPuNN0Bc5J9x6ervEir/dXa5k8=;
        b=l86/SvqX73H1a+j+PrmBr6Vxd6J/fdzKvaBHYpvqyfHR9qidKV6vklsqyPOb6oRIno
         2Vd1GqIAzWiYu6P83WNuP0i0Ino/RFAzj00Ja9IdTJxaruuKtGyXPOH+smqfs3JloLeO
         q4J5eV/QTjKHhOuPM9bp5B3Db5N21GsMcjkyUboDe+53VuqtTGScYRgqPT8aZeiPlvVa
         7FDipvdK98Rg3Bk+q0X7vWQQtKyzJJj6WP97gqLnQJysg2/MqtYaWs6PqYKyg11HwX6Q
         3dOqpPgjfSJQZVVhNdzqC7Mkc0TVLZVLYgnz35ICPF6Y4bI4u9cnBxzDz8eg/H2RTX5W
         p6nA==
X-Gm-Message-State: AFq9FYLVc8O6LrUtJ/nE2pNzYShUc/GurHxnVv6RFoQg7d6UhsTP+OeE
	q9/nyWCibvzWxzmmaOXlsadiyyrGvFPVSs4s8s2eArRhqaDgGs0MYrUR
X-Gm-Gg: AYBFou2jpbGdk7Ml7mRuTXnH4gTXBLQ27tn5uARopdERe7CAW1/dkO0BUqDbggNJpGh
	oSQVHZG3fKcig/xcPcErGgjXi+khIR8IXT2Owqh8pfnU8kTsbQh4wToQQCoQXbuw5yZLfDSPacU
	+WccCI8fY/EyshpchT519+9E9dRVcmSNxzwCi6+2RJG7bJG5XM0/5SBytvLorhh/Ww52v2zQK9R
	ZWywAZsnI3z1SwbiwU+R4T8U7DknMnZK5Pxc5Qo4eoHrbEvBQuEsoo1LLj6NBlBfGEL3sHY4B17
	pryc4xqntk0sdwRduolQCwPo09a5Yxtr5S2C8jIaLxiGcesq1QZ08dXrd+pidrqGcfzqu5u1R/r
	KDG8qv/kdqyZJ0J9/TVPbFB4to8aOLeG9690x0sHM9CfQ2Cw3FI0TWjjCeSzvSrF0d7Rn+xdGX3
	8eOTpjPZ+oXsD9IdNsQNzIJabhdtXC1830XsEeZKWJXwH0wIQSO6eQK5ng5IeDpD4XbHQWY3Itv
	/Y6KBAujvyhKOastar7WdCCkepNMPFvMAF2fqwnUX+S7Z01TAXfyznewGUd3jv8VIxidLLIEqrP
	/ac=
X-Received: by 2002:a17:90b:2745:b0:3ab:b39f:41cd with SMTP id 98e67ed59e1d1-3adeafaeb42mr141293a91.60.1792781949789;
        Fri, 23 Oct 2026 11:59:09 -0700 (PDT)
Received: from smtpclient.apple ([187.15.154.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b22416bsm152845ad.72.2026.10.23.11.59.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Oct 2026 11:59:09 -0700 (PDT)
From: "Enji Cooper (yaneurabeya)" <yaneurabeya@gmail.com>
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B7B9466B-5690-434B-A438-A726606751FE";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.3\))
Subject: [PATCH] man/man2/sched_setattr.2: update `EINVAL` case with
 `.sched_flags`
Message-Id: <A89056FB-15B8-454D-9C6F-9EEB75965302@gmail.com>
Date: Fri, 23 Oct 2026 11:58:57 -0700
Cc: linux-man@vger.kernel.org
To: Alejandro Colomar <alx+linux-man@kernel.org>
X-Mailer: Apple Mail (2.3864.700.51.1.3)


--Apple-Mail=_B7B9466B-5690-434B-A438-A726606751FE
Content-Type: multipart/mixed;
	boundary="Apple-Mail=_3E11A123-226C-44D8-B425-115D3B419A34"


--Apple-Mail=_3E11A123-226C-44D8-B425-115D3B419A34
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

In more recent versions of the kernel, `.sched_flags` is a treated as a
bitmask that supports values like `SCHED_FLAG_UTIL_CLAMP_MIN`, etc.

Account for the additional flags so the documentation is up to date with
the kernel implementation of `sched_setattr`.

Ref: linux.git 480a6ca2dc6e ("sched/uclamp: Allow to reset a task uclamp =
constraint value")

Signed-off-by: Enji Cooper <yaneurabeya@gmail.com>
---
 man/man2/sched_setattr.2 | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/man/man2/sched_setattr.2 b/man/man2/sched_setattr.2
index 80a0ac726dcf..64acdd88884f 100644
--- a/man/man2/sched_setattr.2
+++ b/man/man2/sched_setattr.2
@@ -417,7 +417,10 @@ .SH ERRORS
 .B EINVAL
 .I attr.sched_flags
 contains a flag other than
-.BR SCHED_FLAG_RESET_ON_FORK .
+.BR SCHED_FLAG_RESET_ON_FORK ,
+.BR SCHED_FLAG_UTIL_CLAMP_MIN ,
+or
+.BR SCHED_FLAG_UTIL_CLAMP_MAX .
 .TP
 .B EINVAL
 .I attr.sched_priority
--  2.50.1 (Apple Git-155)


--Apple-Mail=_3E11A123-226C-44D8-B425-115D3B419A34
Content-Disposition: attachment;
	filename=0001-man-man2-sched_setattr.2-update-EINVAL-case-with-.sc.patch
Content-Type: application/octet-stream;
	name=0001-man-man2-sched_setattr.2-update-EINVAL-case-with-.sc.patch;
	x-unix-mode=0644
Content-Transfer-Encoding: quoted-printable

=46rom=20b6ec323a19859d9a61773749a049cd142615375c=20Mon=20Sep=2017=20=
00:00:00=202001=0AMessage-ID:=20=
<b6ec323a19859d9a61773749a049cd142615375c.1792781559.git.yaneurabeya@gmail=
.com>=0AFrom:=20Enji=20Cooper=20<yaneurabeya@gmail.com>=0ADate:=20Fri,=20=
23=20Oct=202026=2010:39:20=20-0700=0ASubject:=20[PATCH]=20=
man/man2/sched_setattr.2:=20update=20`EINVAL`=20case=20with=0A=20=
`.sched_flags`=0ATo:=20Alejandro=20Colomar=20<alx+linux-man@kernel.org>=0A=
Cc:=20<linux-man@vger.kernel.org>=0A=0AIn=20more=20recent=20versions=20=
of=20the=20kernel,=20`.sched_flags`=20is=20a=20treated=20as=20a=0A=
bitmask=20that=20supports=20values=20like=20`SCHED_FLAG_UTIL_CLAMP_MIN`,=20=
etc.=0A=0AAccount=20for=20the=20additional=20flags=20so=20the=20=
documentation=20is=20up=20to=20date=20with=0Athe=20kernel=20=
implementation=20of=20`sched_setattr`.=0A=0ARef:=20linux.git=20=
480a6ca2dc6e=20("sched/uclamp:=20Allow=20to=20reset=20a=20task=20uclamp=20=
constraint=20value")=0A=0ASigned-off-by:=20Enji=20Cooper=20=
<yaneurabeya@gmail.com>=0A---=0A=20man/man2/sched_setattr.2=20|=205=20=
++++-=0A=201=20file=20changed,=204=20insertions(+),=201=20deletion(-)=0A=0A=
diff=20--git=20a/man/man2/sched_setattr.2=20b/man/man2/sched_setattr.2=0A=
index=2080a0ac726dcf..64acdd88884f=20100644=0A---=20=
a/man/man2/sched_setattr.2=0A+++=20b/man/man2/sched_setattr.2=0A@@=20=
-417,7=20+417,10=20@@=20.SH=20ERRORS=0A=20.B=20EINVAL=0A=20.I=20=
attr.sched_flags=0A=20contains=20a=20flag=20other=20than=0A-.BR=20=
SCHED_FLAG_RESET_ON_FORK=20.=0A+.BR=20SCHED_FLAG_RESET_ON_FORK=20,=0A=
+.BR=20SCHED_FLAG_UTIL_CLAMP_MIN=20,=0A+or=0A+.BR=20=
SCHED_FLAG_UTIL_CLAMP_MAX=20.=0A=20.TP=0A=20.B=20EINVAL=0A=20.I=20=
attr.sched_priority=0A--=20=0A2.50.1=20(Apple=20Git-155)=0A=0A=

--Apple-Mail=_3E11A123-226C-44D8-B425-115D3B419A34--

--Apple-Mail=_B7B9466B-5690-434B-A438-A726606751FE
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkHfexGRJ3gYRdA2gGpE5DjPsNJgFAmrbrnEACgkQGpE5DjPs
NJjcLg//RTAZDCujeGv7w6DVQh5t6QCOyxITCJG9dBVrSlDnioexbKHeqsxAv6eZ
QLctAgWPaV08HS3BGLmuZVrAOXvcv1PHym6T2P/+BREnZ8YGVoi4TNEo54KbmpsJ
HXm+XkoQP0qHtp1xczRyRm3jWmffVvU4PeEfN2jh3yy7bMzoXppxostk2Qa9+K4y
yFxwVGmBNd+8Yw2mKtJYYXi8XHb3SORBHzrLiViPt8JrG+43OIdS3Rng430CVGZV
oAK6DDZASCloMKxcxuQYtm5soWkXX/+AXCjj+6Ckw+b0+8QEtRVsHMann3CU/5Qe
mpMD6DHDiRxwkM4q6EJgHa6JqJT7sTIe284AxeyIOTlv6+739ZAyOQUAZ83lHrJp
42dPe95cc/B8izNjDQG+2wIizMogibT3lIdMGDy7+JqDgqAob695q49qWgCPLzbK
P5oyT65/LN6yCfpqJVzcOWGe3N8xeyeXT5g7e9NkuTwNVBK7i9wxYEQVdsKNq5z8
XP4im4ovPy5PR3cOJzUY3nD5wAFDLr7stwILHcAEUrj7VEzIfejdlHtm+7NmQJBx
D/JWI51mz2hP0CTEviuMYZiwiyo0LFA1BpSvUJ8lq3VnHndQvHbhCFUA+PyGyJ8C
rfACF/mg+sPzgcZSCeoKwkg6RFfnrufqkv/+EhrevDMxkLDUOG0=
=W1+s
-----END PGP SIGNATURE-----

--Apple-Mail=_B7B9466B-5690-434B-A438-A726606751FE--
