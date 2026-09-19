Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DD7231C91
	for <linux-man@vger.kernel.org>; Sat, 19 Sep 2026 06:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789797972; cv=pass; b=pOJhOqrDH+xCQXrydKA1WrZxGpYKkoXh6SHekFgUqO7y6+eZX0QtAEpOR3NchZOFKuV2DHU9k+LQ3TNgiuEhHhy16/HiELRXEYDiDKMiZYP5iF1QmaPhL+fcY98EUOlPcZbzdD6JDsJs0yyiDaU1SEYpFK3Q5O2nxcrGYJC+wzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789797972; c=relaxed/simple;
	bh=M0JxArudV+2HILuFtwEJ0Oq82uswlzY/A1b/hPOZ0KE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zt3GByOvF6SAZn6CTBhSbOSKk5LHbhch7t6wSTRel4xynjV0MDWXiX1Fhc/yLia9zGtxsSNt22Zj3jNYy7N8wKoB59DCQ25GvRJ5loeAY//v6sw8wwwSL2rvM1dpuRNw6RQnOlrqw8dL7idf4HS3UPDa2hp3IYwsyWvS4BaK88c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nh29pgMb; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nh29pgMb"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4cdc68c1so245848d50.2
        for <linux-man@vger.kernel.org>; Fri, 18 Sep 2026 23:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789797970; cv=none;
        d=google.com; s=arc-20260327;
        b=qjL0Y3dR3well85Ao+Cmv6/63jFyetm6yd70EyyPu1YsqQOFUoj+riDh33beT+VO35
         zHfMz+CtzDlE6Xfn4JECCXs63x0eHX4Ssw3nqyvBk4QVoXBFQptURdFNDaGWH23Ysk21
         sWetcWXzJk5JgGVL6AE56+s9bm0sEDaRkeneYX29JQZ9XEEScGQsmamYIN63Wqy/Boi+
         xpWC3oNAGRSSJD1YOyBWVZ6gBiqZ/LxDfANb5WeEhyGTp/kDDJf2TRa7KcHg6nS26Ep2
         SjLx4QWuozhX7h+ChlUfcDBL2AV+JnWMw4RqUBDDEwgWgV2MO+Ihw4YEuLX5Y2uT5zkG
         sPsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MZvjOtCFSpL6JEBnV+R25Khb4z5BAZ846JnHrw1uBgQ=;
        fh=kTbk4pccRQ7ywKItoF6eFeVMUIye+84NI5zbIP4rQ9Q=;
        b=Jr9Uw3bGZyRcg5tAOm9AahmyTMzatoLnTNUvY77s+oUMoEzfeTbYtz0UyYdZD0g7V2
         h9n//LTzCq9vqho8BAuwl9ukcsY6Gn/AHikD9JAjP8Xcebsbg35U3VCzfOEI+bF7toAo
         sux0gY4WOz0uQI5URkk+836w7fSOF1pLYzL1ka+d1YESUgqoA6xqWNp1bhKWhrqwtybX
         tBk3qFTucdHl03eTJsF3IFlnQdjjVKd2cgZIJSoD5Yck6h538DcgTysuSXbzc/qWyc70
         ywnZ7En6lmdC+ION/k5mOLjikCGhAhiVJApS5DYzATCCpRjLz8TQ8hhQRhVMpT5+Xns5
         vN+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789797970; x=1790402770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MZvjOtCFSpL6JEBnV+R25Khb4z5BAZ846JnHrw1uBgQ=;
        b=Nh29pgMbEaEPGksirEsLll3iBZj0ypkjjwwk6JLOjra10xTIKlTqQJ1lr8I1gVKc+Q
         eKpdpFjdhM6aYRZ0K25mfZwdFGcicXbetwlkRHNROXigAxDo65Q72dp3rfawIh25ogGO
         VqaLBxRqoXK68qKXBuF6ExHF3GgNh5z0KofyOQ8K1hn+pg92HBTP7hkK29de/KW094Z3
         0A6jJ/4sry4lbyU5r5Ygsbjq1KD7LMQKWczIHyPmJC+YKdGPfPfQdDos+G6hkJ2g7vMp
         ZJOs2B8B+TcUW0bVJqhBXmIYXsbVzWyR/xFp99UsnA/+CRBPLxBRFqf212SBSUUozGlr
         JXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789797970; x=1790402770;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MZvjOtCFSpL6JEBnV+R25Khb4z5BAZ846JnHrw1uBgQ=;
        b=djRGhW+o9t5lnCBI6SNFdcbr7nw8xauig9iaCz+hsFYf+I/+VFAFshbhYV0guGr3AJ
         igD+inllX7Iy+HSiqku3ot7OIjoJK8Ord7da4a0NKfu9Uw8TpcJ3CegdSIjiSAGtY4/m
         GeVaN5mEzDEL6rDuyuVMP9+W/8I/5Nx7vN9h1mb3tXmbI1s04yCh96jlh262RhGitp7g
         ZUu8oyCK+9ozmAZVcN6gfg/fAlKO/ySJ9G/PDBIiXE1z2C0HGdE9oF6xpJ74yfWd6JjU
         fYe33SJLJcu0wfUksUp++TuhDbjieihP9uov4HA0zVX3Bqud9TvrGSYLtowvmmLImhFI
         PtRQ==
X-Gm-Message-State: AFuF++mI+X+HV/P9V6AagS+FTzG7spoSqw5C4A/pfIrCcm9HaeiKf03A
	Eq9FzCBg16BbKudzfTq/BLwZtawJ+D7Bjbndc8cN5R72Zlhju9rzlSfJfzYRCsXKu0X0nQReTwu
	D60r/p2B5JECM1xWudXNeGljaiDgPk0E=
X-Gm-Gg: AYBFou1CZ2vMwxmeCAdvivh5Ru3wd5rCVz8dljQnKzBOeEmIW1m1Xy+uBRzqm6zjsZQ
	bgzEM7SctIg5AG7+iC5jVUa0JvIuKX2B91koBqgtkEkEe10EmXL7ceqipF06fp8Af1KOfUo6t/X
	4Vxbxz5eBZBmZQnBgvEU+2KlvebC2w5WufAWtk2ix4A/7fUY3glyQdDrH2EDzMOuIcm9ZF4GcKI
	g1ejqT+mxOgvUS10551sSddGlQfkDvwMTlHbZm9TEwmsbjzxS/pA2VnIF4g8KDBHU+iOv9sd7vP
	Q0u9t/7V1PreT9yRCGi0Ugerb819kvIQByBxNx5DFOKC9+40Q5w7jyRbIJDDRUf7bgKalGpRHTd
	ZvrYkBbIN6uI=
X-Received: by 2002:a05:690e:428f:20b0:66f:c790:9b6b with SMTP id
 956f58d0204a3-671830a43b9mr1676773d50.5.1789797969678; Fri, 18 Sep 2026
 23:06:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAE8uRQ0-xyboJ3gy5wu-EaoQ2UEj4bL74hnrosaMpNkqJ9vYnA@mail.gmail.com>
 <9a02836a5be6c1505a2cff8bc9a5a8f749a160c4.1789082120.git.alx@kernel.org>
In-Reply-To: <9a02836a5be6c1505a2cff8bc9a5a8f749a160c4.1789082120.git.alx@kernel.org>
From: Maxim Inozemtsev <milnadar@gmail.com>
Date: Fri, 18 Sep 2026 23:05:58 -0700
X-Gm-Features: AcwNN1X-Do7QwJx_x4pNiwPlP5V85WdrFdBnHM3_3PDnR2gzHtVEhPXmHHKKkzk
Message-ID: <CAE8uRQ2RsF3MBQfzB=roViVr1dAKkATTTos50o0L8=tJ89w4jg@mail.gmail.com>
Subject: Re: [PATCH v2] man/man7/inotify.7: Fix typo in struct size calculation
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I like your corrections.
Please see my sign-off for this patch below:

Signed-off by: Maxim Inozemtsev <milnadar@gmail.com>

Thank you,
Maxim

On Thu, Sep 10, 2026 at 4:17=E2=80=AFPM Alejandro Colomar <alx@kernel.org> =
wrote:
>
> From: Maxim Inozemtsev <milnadar@gmail.com>
>
> Fixes: 18e7c4597c4e (2024-11-17; "man/: Terminology consistency reforms (=
n, size, length)")
> Co-authored-by: Maxim Inozemtsev <milnadar@gmail.com>
> Message-ID: <CAE8uRQ1WhW=3D5X-zCCi4g9y4s-rEYdmY_=3D2o4Re1thKyijV3RXw@mail=
.gmail.com>
> Signed-off-by: Alejandro Colomar <alx@kernel.org>
> ---
>
> Hi Maxim,
>
> I've slightly modified your patch, to be more correct, and show that
> 'len' isn't just a variable, but a structure member.
>
> Do you like this patch?  If so, would you mind signing it?
> <https://www.kernel.org/doc/html/latest/process/submitting-patches.html#w=
hen-to-use-acked-by-cc-and-co-developed-by>
>
>
> Have a lovely night!
> Alex
>
>  man/man7/inotify.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man/man7/inotify.7 b/man/man7/inotify.7
> index 9575b82e7ffb..dcdf95d0665c 100644
> --- a/man/man7/inotify.7
> +++ b/man/man7/inotify.7
> @@ -137,7 +137,7 @@ .SS Reading events from an inotify file descriptor
>  the size of each
>  .I inotify_event
>  structure is thus
> -.IR "sizeof(struct inotify_event)+size" .
> +.IR sizeof(struct\~inotify_event)\~+\~event.len .
>  .P
>  The behavior when the buffer given to
>  .BR read (2)
>
> base-commit: 93337ae940c227db2b4a6141268a41b222df4283
> --
> 2.55.0
>
