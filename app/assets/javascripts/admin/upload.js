$(document).ready(function() {
    var body = $('body')
    //upload
    var client = new OSS.Wrapper({
        region: 'oss-cn-beijing',
        //云账号AccessKey有所有API访问权限，建议遵循阿里云安全最佳实践，创建并使用STS方式来进行API访问
        accessKeyId: 'LTAI7SqWE0vgdMdy',
        accessKeySecret: 'Qgil2R2h6ljmtb1oyEdfs0KQdOAI23',
        // stsToken: '<Your securityToken(STS)>',
        bucket: 'pcyc-public'
    });

    if($('#upload').length > 0){
        body.on('change', '#upload', function (e) {
            var file = e.target.files[0];
            console.log(file)
            var storeAs = guid();
            console.log(file.name + ' => ' + storeAs);
            client.multipartUpload(storeAs, file).then(function (result) {
                console.log(result);
                image_url = result['url'];
                if($('#upload').is('[multiple]')){
                    process_multi_image(image_url)
                }else{
                    process_single_image(image_url)
                }
            }).catch(function (err) {
                console.log(err);
            });
        });
    }

    //.upload


    var process_single_image = function (image_url) {
       $('#image_url').val(image_url);
    };
    var process_multi_image = function (image_url) {
        if ($('div').hasClass('multiple_picture')) {
            $('.multiple_picture').find('.clear-fix').append(
                '<li> <img src="' + image_url + '?imageView2/0/w/250/h/250" alt="图片" > ' +
                '<input type="hidden" name="' + $('.multiple_picture').attr('name_value') + '" value="' + image_url + '"/> ' +
                '<a class="hit_ajax delete" >删除</a> </li>'
            );
        }
        $('#multi_image_upload').children('input').trigger("validate");

        var maxNumber = $('#max-picture-number').attr('max-picture-number') || 10
        var currentNumber = $('#max-picture-number input').length || 0
        if (currentNumber >= maxNumber) {
            $('#multi_image_upload').hide();
        } else {
            $('#multi_image_upload').text('继续上传');
        }
    };



    //生成随机数
    function guid() {
        return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
            s4() + '-' + s4() + s4() + s4();
    }

    function s4() {
        return Math.floor((1 + Math.random()) * 0x10000)
            .toString(16)
            .substring(1);
    }
})