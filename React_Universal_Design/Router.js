const bcrypt = require('bcrypt');
const og = require('open-graph');
const formidable = require('formidable');
const {parse} = require('querystring');
const fs = require('fs');
const request = require('request');
const crypto = require('crypto');

this.uploadDir = __dirname + '/\.tmp';


class Router {
    constructor(app, db) {
        this.login(app, db);
        this.logout(app, db);
        this.isLoggedIn(app, db);
        this.renderPdf(app, db);
        this.deleteFile(app, db);
        this.upload(app, db);
        this.uploadImage(app, db);
        this.savePage(app, db);
        this.openPage(app, db);
        this.linkData(app);
        this.saveExistingPage(app, db);
        this.openPageById(app,db);
        this.deletePage(app,db);
        this.renderOtherFiles(app,db);
    }

    renderPdf(app, db) {
        app.post('/renderPdf', (req, res) => {

            let category = req.body.category;

            let cols = [category];

            db.query("SELECT name,id,category,title,date,extension FROM files WHERE category = ? AND extension = 'pdf'", cols, (err, data, fields) => {
                if (err) {
                    res.json({
                        success: false,
                        msg: 'Error 1'
                    })
                    return;
                }
                if (data && data.length > 0) {
                    res.json({
                        success: true,
                        files: data
                    })
                    return;
                } else {
                    res.json({
                        success: false,
                        msg: 'This is empty'
                    })
                    return;
                }
            });


        });
    }


    renderOtherFiles(app, db) {
        app.post('/renderOtherFiles', (req, res) => {

            let category = req.body.category;

            let cols = [category];

            db.query("SELECT name,id,category,title,date,extension FROM files WHERE category = ? AND extension!='pdf'", cols, (err, data, fields) => {
                if (err) {
                    res.json({
                        success: false,
                        msg: 'Error 1'
                    })
                    return;
                }
                if (data && data.length > 0) {
                    res.json({
                        success: true,
                        files: data
                    })
                    return;
                } else {
                    res.json({
                        success: false,
                        msg: 'This is empty'
                    })
                    return;
                }
            });


        });
    }
    openPage(app, db) {
        app.post('/openPage', (req, res) => {
            let category = req.body.category;

            let cols = [category];

            db.query('SELECT * FROM jsondoc where Category = ?', cols, (err, data, fields) => {
                if (err) {
                    res.json({
                        success: false,
                        msg: 'Error 1'
                    })
                    return;
                }
                if (data && data.length > 0) {
                    res.json({
                        success: true,
                        data: data
                    })
                    return;
                } else {
                    res.json({
                        success: false,
                        msg: 'This is empty'
                    })
                    return;
                }
            });


        });
    }


    openPageById(app, db) {
        app.post('/openPageById', (req, res) => {
            let id = req.body.id;

            let stringParse = parseInt(id, 10);
            let cols = [stringParse];

            db.query('SELECT * FROM jsondoc where DocId =  ?', [cols], (err, data, fields) => {
                if (err) {
                    res.json({
                        success: false,
                        msg: 'Error 1'
                    })
                    return;
                }
                if (data && data.length > 0) {
                    res.json({
                        success: true,
                        data: data
                    })
                    return;
                } else {
                    res.json({
                        success: false,
                        msg: 'This is empty'
                    })
                    return;
                }
            });


        });
    }

    deletePage(app, db) {
        app.post('/deletePage', (req, res) => {
            let id = req.body.id;

           // let stringParse = parseInt(id, 10);
            //let cols = [stringParse];
            let cols = [id];
            db.query('DELETE FROM jsondoc WHERE DocId =  ?', [cols], (err, data, fields) => {
                if (err) {
                    res.json({
                        success: false,
                        msg: 'Error 1'
                    })
                    return;
                }
                else {
                    res.json({
                        success: true,
                    })
                    return;
                }
            });

        });
    }


    savePage(app, db) {
        app.post('/savePage', (req, res) => {

            if (req.files === null) {
                return res.status(400).json({msg: 'No file uploaded'});
            }

            const name = req.body.name;
            const category = req.body.category;
            const json = req.body.data;

            let records = [[json, name, category]];

            db.query("INSERT INTO jsondoc (Data, Name, Category) VALUES ?", [records], (err, data, fields) => {
                if (err) {
                    res.json({success: false, msg: 'SQL er feil, 1'});
                    return;
                }
                if (data.affectedRows > 0) {
                    res.json({success: true});
                    return;

                } else {
                    res.json({success: false, msg: 'SQL er feil , no affected rows'});
                    return;
                }

            });


        });
    }

    saveExistingPage(app, db) {
        app.post('/saveExistingPage', (req, res) => {

            if (req.files === null) {
                return res.status(400).json({msg: 'No file uploaded'});
            }

            const name = req.body.name;
            const json = req.body.data;
            const id = req.body.id;

            let sql2 = `UPDATE jsondoc
            SET Data = ?,
            Name = ?
            WHERE DocId = ?`;

            let stringParse = parseInt(id, 10);
            let data = [json, name, stringParse];


            db.query(sql2, data, (err, data, fields) => {
                if (err) {
                    res.json({success: false, msg: 'SQL er feil, 1'});
                    return;
                }
                if (data.affectedRows > 0) {
                    res.json({success: true});
                    return;

                } else {
                    res.json({success: false, msg: 'SQL er feil , no affected rows'});
                    return;
                }

            });


        });
    }


    linkData(app) {
        app.get('/fetchUrl', (req, res) => {
                const {method, url} = req;
                if (method.toLowerCase() !== 'get') {
                    res.end();
                    return;
                }

                const link = decodeURIComponent(url.slice('/fetchUrl?url='.length));


                og(link, function (err, meta) {
                    if (meta) {
                        res.end(JSON.stringify({
                            success: 1,
                            meta
                        }));
                    } else {
                        res.end(JSON.stringify({
                            success: 0,
                            meta: {}
                        }));
                        console.log(err);
                    }
                });
            }
        )

    }

    deleteFile(app, db) {
        app.post('/deleteFile', (req, res) => {

            let name = req.body.name;


            let id = req.body.id;


            db.query('DELETE FROM files WHERE id = ?', [id], (err, data, fields) => {
                if (err) {
                    res.json({
                        success: false,
                        msg: 'Error 1'
                    })
                    return;
                } else {
                    const fs = require('fs')
                    let file = 'build/Files/' + name;
                    try {
                        fs.unlinkSync(file)
                        //file removed
                    } catch (e) {
                        console.error(e);
                    }

                    res.json({
                        success: true
                    })
                    return;
                }

            });

        });
    }

    login(app, db) {
        app.post('/Trylogin', (req, res) => {
            let username = req.body.username;
            let password = req.body.password;

            username = username.toLowerCase();

            if (username.length > 12 || password.length > 12) {
                res.json({
                    success: false,
                    msg: 'Error'
                })
                return;
            }
            let cols = [username];
            db.query('SELECT * FROM user WHERE username = ? LIMIT 1', cols, (err, data, fields) => {
                if (err) {
                    res.json({
                        success: false,
                        msg: 'Error'
                    })
                    return;
                }
                //Found one user with this username
                if (data && data.length === 1) {
                    bcrypt.compare(password, data[0].password, (bcryptErr, verified) => {
                        if (verified) {
                            req.session.userID = data[0].id;
                            res.json({
                                success: true,
                                username: data[0].username
                            })
                            return;
                        } else {
                            res.json({
                                success: false,
                                msg: 'Invalid password'
                            })
                        }
                    })

                } else {
                    res.json({
                        success: false,
                        msg: 'User not exist'
                    })
                }
            });

        });
    }

    logout(app, db) {

        app.post('/logout', (req, res) => {

            if (req.session.userID) {
                req.session.destroy();
                res.json({
                    success: true
                })
                return true;
            } else {
                res.json({
                    success: false
                })
            }
        });
    }

    upload(app, db) {


        app.post('/upload', (req, res) => {
            if (req.files === null) {
                return res.status(400).json({msg: 'No file uploaded'});
            }


            const file = req.files.file;


            const split = file.name.split(".");
            const extension = split[1];

            const title = req.body.title;
            const category = req.body.category;

            let today = new Date();
            let dd = String(today.getDate()).padStart(2, '0');
            let mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
            let yyyy = today.getFullYear();

            today = dd + '.' + mm + ' ' + yyyy;

            let records = [[file.name, category, title, today, extension]];

            db.query("INSERT INTO files (name, category, title, date, extension) VALUES ?", [records], (err, data, fields) => {
                if (err) {
                    res.json({success: false, msg: 'SQL er feil, 1'});
                    return;
                }
                if (data.affectedRows > 0) {
                    file.mv(`${__dirname}/build/Files/${file.name}`, err => {
                        if (err) {
                            console.error(err);
                            return res.status(500).send(err);
                        }
                        res.json({
                            fileName: file.name,
                            filePath: `/Files/${file.name}`,
                            title: title,
                            category: category,
                            success: true
                        });
                        return;

                    });
                } else {
                    res.json({success: false, msg: 'SQL er feil , no affected rows'});
                    return;
                }

            });


        });


    }
/*
    getForm(request) {
        return new Promise((resolve, reject) => {
            const form = new formidable.IncomingForm();

            form.uploadDir = `${__dirname}/build/Images`;
            form.keepExtensions = true;

            form.parse(request, (err, fields, files) => {
                if (err) {
                    reject(err);
                } else {
                    console.log('fields', fields);
                    console.log('files', files);
                    resolve({files, fields});
                }
            });
        });
    }

    uploadImage(app, db) {

        app.post('/uploadImage', (req, res) => {
            let responseJson = {
                success: 0
            };
            this.getForm(req)
                .then(({files}) => {
                    let image = files['image'] || {};
                    responseJson.success = 1;
                    responseJson.file = {
                        url: image.path,
                        name: image.name,
                        size: image.size
                    };

            })
        .catch((error) => {
                console.log('Uploading error', error);
            })
                .finally(() => {
                    res.writeHead(200, {'Content-Type': 'application/json'});
                    res.end(JSON.stringify(responseJson));
                });
        });

    }*/

    uploadImage(app, db) {
        app.post('/uploadImage', (req, res) => {

            req.files.image.mv(`${__dirname}/build/Images/${req.files.image.name}`, err => {
                if (err) {
                    console.error(err);
                    return res.status(500).send(err);
                }


                res.json({
                    'success': 1,
                    'file': {
                        'url' : '/Images/'+req.files.image.name

                    }
                });
                return;

            });
        });
    }


    isLoggedIn(app, db) {
        app.post('/isLoggedIn', (req, res) => {
            if (req.session.userID) {
                let cols = [req.session.userID];
                db.query('SELECT * FROM user WHERE id = ? LIMIT 1', cols, (err, data, fields) => {

                    if (data && data.length === 1) {
                        res.json({
                            success: true,
                            username: data[0].username
                        })
                        return true;
                    } else {
                        res.json({
                            success: false
                        })
                    }
                });

            } else {
                res.json({
                    success: false
                })
            }
        });
    }
}


module.exports = Router;